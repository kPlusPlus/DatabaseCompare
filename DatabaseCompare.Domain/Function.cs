using System;
using System.Data.SqlClient;

using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;


namespace DatabaseCompare.Domain
{
	/// <summary>
	/// Summary description for Function.
	/// </summary>
	public class Function : DatabaseObject
	{
        string textDefinition;

		// CT - check text
		public string[] strCTRule = new string[500];
		public string[] strCTProcess = new string[500];

	    public Function( string name, int id ) : base( name, id )
	    {
	    }

        public override void GatherData( SqlConnection conn )
        {
            base.GatherData( conn );
            using( SqlCommand command = conn.CreateCommand() )
            {
                //command.CommandText = "select text from syscomments where id=@id and text != null";
                command.CommandText = "SELECT text FROM syscomments WHERE id=@id AND encrypted = 0";                
                //command.Parameters.Add( "@id", this.Id );
                command.Parameters.AddWithValue("@id", this.Id);
                using ( SqlDataReader reader = command.ExecuteReader() )
                {
                    while( reader.Read() )
                        textDefinition += reader.GetString( 0 ).Trim().ToLower();
                }
            }
        }

        public string TextDefinition
        {
            get { return textDefinition; }
            set { textDefinition = value; }
        }

        protected override bool LocalCompare( DatabaseObject obj )
        {
            string strA, strB;

			strA = clearString( this.TextDefinition );
			strB = clearString( ((Function)obj).TextDefinition );

            strA = strA.Replace("\r", "");
            strA = strA.Replace("\n", "");
            strA = strA.Replace("\t", "");
            strB = strB.Replace("\r", "");
            strB = strB.Replace("\n", "");
            strB = strB.Replace("\t", "");


			if ( obj is Function )
			{
				if (strA != strB || strA.CompareTo(strB) > 0 )
				{
                    StrWrite = new StreamWriter("Function " + obj.Name + "A.sql", true);	
					StrWrite.Write( strA );
					StrWrite.Close();

                    StrWrite = new StreamWriter("Function " + obj.Name + "B.sql", false);	
					StrWrite.Write( strB );
					StrWrite.Close();                    
				}
				return strA == strB;
			}
                //return this.TextDefinition == ((Function)obj).TextDefinition;
            return false;
        }

		// funckija za èišæenje svih gluposti iz stringa
		public string clearString (string strClear)
		{
			// proèitaj XML sa svim pravilima
			// uèitavanje funkcija
            if (strClear == null)
                strClear = " ";
			
			XmlDocument xmlDoc = new XmlDocument();	
			
			// putanju treba promijeniti na putanju aplikacije
			
			xmlDoc.Load(".\\xFunction.xml");
			int i = 0;			

			foreach(XmlElement elem in xmlDoc.SelectNodes("Function/Rule") )
			{
				strCTRule[i] = elem.InnerXml;
				strCTProcess[i] = elem.GetAttribute("process").ToString();
				
				// ReGex
				// replace
				// input: process Replace  strFind strReplacment				
				// output strClear
				
				if (strCTProcess[i] == "replace" )
				{					
					strClear = Regex.Replace(strClear,elem.GetAttribute("strFind").ToString(),elem.GetAttribute("strReplacment").ToString(),RegexOptions.ECMAScript);		
				}

                if (strCTProcess[i] == "replaceStandard")
                {
                    string strFind, strReplacment;
                    strFind = elem.GetAttribute("strFind");
                    strReplacment = elem.GetAttribute("strReplacment");
                    strClear = Regex.Replace(strClear, strFind, strReplacment);
                }                    


				i++;				
			}			
			return strClear;
			//return "";
		}
	}
}
