import yaml;
import os;

config: "Config | None" = None;

class Config:
  @staticmethod
  def get_config() -> "Config":
    global config;
    if config is not None:
      return config;
    raise ValueError("Config not initialized");

  def __init__(self, override_config_file_path: str | None = None):
    global config;
    self.config = yaml.safe_load(open(os.path.join(os.path.dirname(__file__), "default.yml")))

    if override_config_file_path is not None:
      self.config.update(yaml.safe_load(open(override_config_file_path)))

    config = self;

  def get_module_name(self, inline_module_name: str):
    module_config = self.config["modules"].get(self.config["inline_modules"][inline_module_name]["map_to"], None)
    if module_config is None:
      raise ValueError(f"Module {self.config["inline_modules"][inline_module_name]["map_to"]} for inline module {inline_module_name} not found")
    return self.config["inline_modules"][inline_module_name]["map_to"]

  def __getitem__(self, name: str) -> any:
    return self.config[name];