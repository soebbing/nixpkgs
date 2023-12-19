{ runCommand, pdal }:

let
  inherit (pdal) pname version;
in
runCommand "${pname}-tests" { meta.timeout = 60; }
  ''
    ${pdal}/bin/pdal --version | grep 'pdal ${version}'
    ${pdal}/bin/pdal --drivers
    touch $out
  ''
