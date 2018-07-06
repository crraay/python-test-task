import click, re, collections

@click.command()
@click.option('-u', is_flag=True, help='unique matches only')
@click.option('-c', is_flag=True, help='displays total count of found matches')
@click.option('-l', is_flag=True, help='displays total count of lines at least one match was found')
@click.option('-s', default='abc', type=click.Choice(['abc', 'freq']), help='sorts found matches by alphabet or frequency')
@click.option('-o', default='asc', type=click.Choice(['asc', 'desc']), help='sorting order')
@click.option('-n', default=0, type=click.IntRange(0), help='displays first n matches')
@click.option('--stat', type=click.Choice(['count', 'freq']), help='displays list of unique matches with statistic')
@click.argument('regexp')
@click.argument('file', type=click.File('r'))
def run(u, c, l, s, o, n, stat, regexp, file):
	try:
		#9 list of unique matches with statistic
		if stat:
			#because of stat requires unique matches 
			u = True

			if c:
				c = False
				click.echo('because of "stat" defined, "c" sets to False')
			if l:
				l = False
				click.echo('because of "stat" defined, "l" sets to False')

		#5(l) total count of lines at least one match was found
		if l:
			pattern = re.compile('^.*'+regexp+'.*$', re.MULTILINE)
		else:
			pattern = re.compile(regexp)

		text = file.read()
		file.close()
		
		result = pattern.findall(text)
		counts = collections.Counter(result)
		count = len(result)

		if count==0:
			click.echo('nothing was found by "'+regexp+'" pattern')
			return

		#click.echo('input: '+str(result))

		#2 unique matches only
		if u:
			#result = list(set(result))
			result = list(collections.OrderedDict.fromkeys(result))

		#click.echo('after u: '+str(result))

		#6(s) sort matches by abc or freq
		if s=='abc':
			result = sorted(result)
		elif s=='freq':
			result = sorted(result, key=counts.get, reverse=True)

		#click.echo('after s: '+str(result))

		#7(o) sort order
		if o=='desc':
			result = list(reversed(result))
		elif o=='asc':
			#do nothing
			pass

		#click.echo('after o: '+str(result))

		#8(n) list of n matches
		if n>0:
			result = result[0:n]

		#click.echo('after n: '+str(result))

		#3(c) total count of found matches
		#5(l) total count of lines at least one match was found
		if c | l:
			result = len(result)

		if stat:
			if stat=='count':
				click.echo('Substring | Count')
				for r in result:
					click.echo(r+' | '+str(counts[r]))
			elif stat=='freq':
				click.echo('Substring | Frequency')
				for r in result:
					click.echo(r+' | '+str(float("{0:.2f}".format(counts[r]/count))))
		else:
			click.echo(result)

		return result
	except Exception as e:
		click.echo('something went wrong: '+str(e))

if __name__ == '__main__':
	run()