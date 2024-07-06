#include <cstdlib>
#include <cstring>
#include <fstream>
#include <string>
#include <vector>

struct BuildConfig {
  std::string build_system = "cmake";
  std::string build_folder = ".";
  std::string target_name = "a.out";
};

std::vector<std::string> split(const std::string &str, char delim) {
  std::vector<std::string> res;

  std::string buf;
  for (char s : str) {
    if (s == delim) {
      res.push_back(buf);
      buf = "";
    } else if (s != ' ' && s != '\t' && s != '\n')
      buf.push_back(s);
  }
  res.push_back(buf);

  return res;
}

int main(int argc, const char **argv) {
  BuildConfig bc;

  std::ifstream file(".build-config");

  if (file.is_open()) {
    while (!file.eof()) {
      std::string line;
      std::getline(file, line);
      std::vector<std::string> tokens = split(line, ':');
      if (tokens[0] == "build")
        bc.build_system = tokens[1];
      else if (tokens[0] == "folder")
        bc.build_folder = tokens[1];
      else if (tokens[0] == "target")
        bc.target_name = tokens[1];
    }
  }

  if (bc.build_folder != ".")
    system(static_cast<const char *>(("mkdir " + bc.build_folder).c_str()));
  if (bc.build_system == "cmake")
    system(static_cast<const char *>(
        ("cd " + bc.build_folder +
         " && cmake .. -G Ninja && cmake --build . && cd ..")
            .c_str()));
  else if (bc.build_system == "make")
    system("make");

  if (argc != 1 && strcmp(argv[1], "run") == 0)
    system(static_cast<const char *>(
        ("./" + bc.build_folder + "/" + bc.target_name).c_str()));

  return 0;
}
