using System;
using System.Data.SqlClient;

using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;



namespace DatabaseCompare.Domain
{
	/// <summary>
	/// Summary description for StoredProc.
	/// </summary>
	public class StoredProc : DatabaseObject
	{
        string textDefinition;
        //Database doDatabaseObject = new Database();

		// CT - check text
		public string[] strCTRule = new string[500];
		public string[] strCTProcess = new string[500];


	    public StoredProc( string name, int id ) : base( name, id )
	    {
	    }

        public override void GatherData( SqlConnection conn )
        {
            base.GatherData( conn );
            using( SqlCommand command = conn.CreateCommand() )
            {
                // ovo radi command.CommandText = "select text from syscomments where id=@id and text != null";
                command.CommandText = "select text from syscomments where id=@id and encrypted = 0";
                //command.CommandText = "select text from syscomments where id=@id and encrypted=@encrypted";
                //command.Parameters.Add( "@id", this.Id );
                command.Parameters.AddWithValue("@id", this.Id);

                //if (doDatabaseObject.boCheckEnc)
                //    command.Parameters.Add("@encrypted", 1);
                //else
                //    command.Parameters.Add("@encrypted", 0);


                try
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                            //if (reader.GetString(0).Trim().ToLower() != null)
                            //textDefinition += reader.GetString(0).Trim().ToLower();
                            textDefinition += reader.GetString(0);
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
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
			string strA,strB;

			strA = clearString( this.TextDefinition );			
			strB = clearString( ((StoredProc)obj).TextDefinition );

            //strA = strA.Replace("\r", "");
            //strA = strA.Replace("\n", "");
            //strA = strA.Replace("\t", "");
            //strB = strB.Replace("\r", "");
            //strB = strB.Replace("\n", "");
            //strB = strB.Replace("\t", "");
			
			if ( obj is StoredProc )
			{
				if (strA != strB)
				{
					// left side
                    StrWrite = new StreamWriter("StoredProc " + obj.Name + "A.sql", true);	
					StrWrite.Write( strA );
					StrWrite.Close();

					// right side
                    StrWrite = new StreamWriter("StoredProc " + obj.Name + "B.sql", true);
					StrWrite.Write( strB );
					StrWrite.Close();
				}
				return strA == strB;
			}
                //return this.TextDefinition == ((StoredProc)obj).TextDefinition;
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
			
			xmlDoc.Load(".\\xStoreProcedure.xml");
            //xmlDoc.LoadXml(".\\xStoreProcedure.xml");
			int i = 0;			

			foreach(XmlElement elem in xmlDoc.SelectNodes("StoreProcedure/Rule") )
			{
				strCTRule[i] = elem.InnerXml;
				strCTProcess[i] = elem.GetAttribute("process").ToString();
				
				// ReGex
				// replace
				// input: process Replace  strFind strReplacment				
				// output strClear
				
				if (strCTProcess[i] == "replace" )
				{					
					// strClear = Regex.Replace(strClear,elem.GetAttribute("strFind").ToString(),elem.GetAttribute("strReplacment").ToString(),RegexOptions.IgnoreCase| RegexOptions.Multiline|RegexOptions.ECMAScript);		
					// sve treba zadati preko xml-a					
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
