from enum import Enum

class InstanceType(Enum):
    LINEAR = "linear";
    NON_LINEAR = "non-linear";
    REGISTER = "register";
    INVERSION = "inversion";
    MAPPING = "mapping";