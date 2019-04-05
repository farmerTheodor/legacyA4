n = 1000
length = (10*n)/3
nines = 0
predigit = 0

a = [2 for z in range(0,int(length))]
print("please give a filename")
fileName = input()
with open(fileName,"w") as output:
	for j in range(0, n):
		q = 0
		for i in range(int(length),0,-1):
			x  = int(10 * a[i-1]) + q*i
			a[i-1] = x % (2*i - 1)
			q = int(x / (2*i - 1))
		a[0] = q % 10
		q = int(q/10)
		if(q == 9):
			nines = nines + 1
		elif(q == 10):
			output.write(str(predigit + 1))
			for k in range(0, nines):
				output.write(str(0))
			predigit = 0
			nines = 0
		else:
			output.write(str(predigit))
			predigit = q
			if( nines != 0):
				for k in range(0, nines):
					output.write(str(9))
				nines = 0
	output.write(str(predigit) + "\n")