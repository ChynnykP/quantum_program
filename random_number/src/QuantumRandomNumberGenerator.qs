namespace QuantumRandomNumberGenerator {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;

    @EntryPoint()
    operation Main() : Int {
        let max = 100;
        Message($"Sampling a random number between 0 and {max}: ");

        // Generate random number in the 0 .. max range
        return GenerateRandomNumberInRange(max);
    }

    // Generates a random number between 0 and 'max'
    operation GenerateRandomNumberInRange(max : Int) : Int {
        // bits which represent random number
        mutable bits = [];

        // get number bits
        let nBits = BitSizeI(max);

        // generate random number
        for idxBit in 1 .. nBits {
            set bits += [GenerateRandomBit()];
        }

        // convert random bit string to integer number
        let sample = ResultArrayAsInt(bits);

        // generate new random number if sample > max else return sample
        return sample > max ? GenerateRandomNumberInRange(max) | sample;
    }

    operation GenerateRandomBit() : Result {
        // Allocate a qubit
        use q = Qubit();

        // Set qubit to superposition
        H(q);

        // Measure a qubit q
        let result = M(q);

        // Reset qubit to |0> state
        // Qubit must be in the |0> state by the time they are released
        Reset(q);

        // Return result
        return result;
    }
}