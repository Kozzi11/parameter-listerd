import std.range.interfaces : OutputRange;

class TerminalOutput : OutputInterface
{
    void process(OutputRange!(string) o, string[] args)
    {
        foreach(arg; args) {
            o.put(arg);
            o.put("\n");
        }
    }
}

class XmlOutput : OutputInterface
{
    void process(OutputRange!(string) o, string[] args)
    {
        import std.xml : encode;

        o.put("<parameters>"); o.put("\n");
		foreach (arg; args) {
            o.put("\t<parameter>");
            o.put(arg.encode);
            o.put("</parameter>");
            o.put("\n");            
        }
        o.put("</parameters>"); o.put("\n");
    }
}

interface  OutputInterface
{
    void process(OutputRange!(string) o, string[] args);    
}