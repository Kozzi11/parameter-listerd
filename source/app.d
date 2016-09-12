import std.stdio;
import std.traits : fullyQualifiedName;
import std.experimental.logger : log, LogLevel;
import std.process : environment;
import std.range : outputRangeObject, popFront;

import output : TerminalOutput, OutputInterface;

enum ENV_OUTPUT_MODULE_NAME = "PARAMETER_LISTER_OUTPUT";
enum DEFAULT_MODULE = fullyQualifiedName!TerminalOutput;

void main(string[] args)
{
	scope(failure) log(LogLevel.critical, "Unexpected exception, probably bug.");
	auto moduleName = environment.get(ENV_OUTPUT_MODULE_NAME, DEFAULT_MODULE);						
	OutputInterface outputObj = cast(OutputInterface) Object.factory(moduleName);
	outputObj.process(outputRangeObject!(string)(stdout.lockingTextWriter), args[1 .. $]);
}
