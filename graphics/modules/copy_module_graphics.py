from pathlib import Path
import os
import shutil

factorio_path = Path("/Users/xavier/Library/Application Support/Steam/steamapps/common/Factorio/factorio.app/Contents/data")
module_types = ["quality", "productivity", "speed", "efficiency"]

def has_module_in_name(p):
  for module in module_types:
    if module in str(p):
      return True

  return False

def num_there(s):
  return any(i.isdigit() for i in s)

os.makedirs("working_files", exist_ok=True)

for p in factorio_path.glob("**/graphics/icons/**/*-module*"):
  if not has_module_in_name(p):
    continue

  if not num_there(p.name):
    shutil.copyfile(p, "working_files/"+p.stem+"-1"+p.suffix)
  else:
    shutil.copyfile(p, "working_files/"+p.name)

for p in factorio_path.glob("**/graphics/technology/**/*-module*"):
  if not has_module_in_name(p):
    continue

  shutil.copyfile(p, "working_files/"+p.stem+"-tech"+p.suffix)
