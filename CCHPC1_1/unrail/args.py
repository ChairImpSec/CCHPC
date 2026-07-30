import argparse;
from version import get_version;

_args: argparse.Namespace | None = None;

def get_args() -> argparse.Namespace:
  global _args;
  if _args is not None:
    return _args;

  parser = argparse.ArgumentParser(
    description="An optimization framework to reduce area of masked implementations with composable gadgets of constant cycle schemes",
    epilog="Version " + get_version() + ". For more information, please visit the git repository at https://github.com/ChairImpSec/CCHPC",
  );

  # Required args
  parser.add_argument("-f", "--file", type=str, required=True, help="The path to the input file");
  parser.add_argument("-o", "--output", type=str, required=True, help="The path to the output directory");

  # Optional args
  # parser.add_argument("-p", "--parser", type=str, default="pseudo", choices=["pseudo", "verilog"], help="The parser to use for the input file");
  parser.add_argument("-c", "--config", type=str, default=None, help="The path to the config file used to override the default config");
  parser.add_argument("--disable-f2b", action="store_true", default=False, help="Disable the front to back optimization (No register stage will be placed, Input will be in Dual Rail)");
  parser.add_argument("--disable-b2f", action="store_true", default=False, help="Disable the back to front optimization (Output will be in Dual Rail)");
  parser.add_argument("--debug-f2b", action="store_true", default=False, help="Open interactive debug window for the front to back optimization during the run");

  _args = parser.parse_args();
  return _args;