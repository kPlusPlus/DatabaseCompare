using System;

namespace DatabaseCompare.Domain
{
	/// <summary>
	/// Summary description for Column.
	/// </summary>
	public class Column
	{
        string name;
        int type;
        int length;
        int scale;

	    public Column( string name, int type, int length, int scale )
	    {
	        this.name = name;
	        this.type = type;
	        this.length = length;
	        this.scale = scale;
	    }

	    public string Name
	    {
	        get { return name; }
	        set { name = value; }
	    }

	    public int Type
	    {
	        get { return type; }
	        set { type = value; }
	    }

	    public int Length
	    {
	        get { return length; }
	        set { length = value; }
	    }

	    public int Scale
	    {
	        get { return scale; }
	        set { scale = value; }
	    }

        public bool CompareTo( Column c )
        {
			// ovo je pregruba komparacija
            return this.Name == c.Name && this.Type == c.Type &&
                this.Length == c.Length && this.Scale == c.Scale;
        }
	}
}
