class RandomnessCounter:
    """
    Hands out randomness from two separate pools:
    - gadgets with dual-rail output draw from every vector of the dual-rail output pool (e.g. {"sr": ..., "dr": ...})
    - gadgets with single-rail output draw all of their (single-rail) bits from the single-rail output pool ({"sr": ...})
    """

    def __init__(self, dual_rail_output_pool: dict[str, str], single_rail_output_pool: dict[str, str]):
        self.dual_rail_output_pool = dual_rail_output_pool
        self.single_rail_output_pool = single_rail_output_pool
        self.dual_rail_output_counter = 0
        self.single_rail_output_counter = 0

    @staticmethod
    def _select(name: str, start: int, random_bit_count: int) -> str:
        if random_bit_count == 1:
            return f"{name}[{start}]"
        return f"{name}[{start}:{start + random_bit_count - 1}]"

    def __call__(self, random_bit_count: int, single_rail_output: bool) -> dict[str, str]:
        if single_rail_output:
            res = {key: self._select(name, self.single_rail_output_counter, random_bit_count) for key, name in self.single_rail_output_pool.items()}
            self.single_rail_output_counter += random_bit_count
            return res

        res = {key: self._select(name, self.dual_rail_output_counter, random_bit_count) for key, name in self.dual_rail_output_pool.items()}
        self.dual_rail_output_counter += random_bit_count
        return res
