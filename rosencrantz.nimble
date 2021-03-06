mode = ScriptMode.Verbose

packageName   = "rosencrantz"
version       = "0.3.0"
author        = "Andrea Ferretti"
description   = "Web server DSL"
license       = "Apache2"
skipDirs      = @["tests", "htmldocs"]

requires "nim >= 0.15.0"

--forceBuild

proc configForTests() =
  --hints: off
  --linedir: on
  --stacktrace: on
  --linetrace: on
  --debuginfo
  --path: "."
  --run


task server, "run server":
  configForTests()
  setCommand "c", "tests/server"

task client, "run client":
  configForTests()
  setCommand "c", "tests/client"

task gendoc, "generate documentation":
  --docSeeSrcUrl: https://github.com/andreaferretti/rosencrantz/blob/master
  --project
  setCommand "doc2", "rosencrantz"

task todo, "run todo example":
  --path: "."
  --run
  setCommand "c", "tests/todo"