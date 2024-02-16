import qsharp

# set the root folder for the project
# make adjustments to the path depending on where your program is saved
qsharp.init(project_root = './random_number')

result = qsharp.eval('QuantumRandomNumberGenerator.GenerateRandomNumberInRange(100)')

print(result)
