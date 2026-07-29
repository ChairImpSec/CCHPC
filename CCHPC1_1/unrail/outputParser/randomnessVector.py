class RandomnessCounter:
    def __init__(self, vector_name: str, start_index: int = 0):
        self.counter = start_index
        self.vector_name = vector_name

    def __call__(self, random_bit_count: int) -> str:
        if random_bit_count == 1:
            res = f"{self.vector_name}[{self.counter}]"
            self.counter += 1
            return res

        res = f"{self.vector_name}[{self.counter}:{self.counter + random_bit_count - 1}]"
        self.counter += random_bit_count
        return res