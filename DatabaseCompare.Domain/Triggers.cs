using System;
using System.Data.SqlClient;

using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;



namespace DatabaseCompare.Domain
{
	/// <summary>
	/// Summary description for Triggers.
	/// nova klasa tako da treba
	/// jako jako istestirati
	/// </summary>
	public class Triggers : DatabaseObject
	{
		public string textDefinition;

		// CT - check text
		public string[] strCTRule = new string[500];
		public string[] strCTProcess = new string[500];


		public Triggers( string name, int id ) : base( name, id )
		{
		}

		public override void GatherData( SqlConnection conn )
		{
			base.GatherData( conn );
			using( SqlCommand command = conn.CreateCommand() )
			{
                command.CommandText = "select text from syscomments where id=@id and encrypted = 0";
                //command.CommandText = "SELECT isnull(text,' ') as text FROM syscomments WHERE id=@id AND encrypted = 0";                                                
				//command.Parameters.Add( "@id", this.Id );
                command.Parameters.AddWithValue("@id", this.Id);
				using ( SqlDataReader reader = command.ExecuteReader() )
				{
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            textDefinition += reader.GetString(0).Trim().ToLower();
                        }
                    }
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

            if (this.textDefinition == null)
                strA = "";
            else
			    strA = clearString( this.TextDefinition.ToString() );

            if (((Triggers)obj).TextDefinition == null)
                strB = "";
            else
                strB = clearString( ((Triggers)obj).TextDefinition.ToString() );			
            			
			if ( obj is Triggers )
			{
				if (strA != strB)
				{
                    StrWrite = new StreamWriter("Triggers " + obj.Name + "A.sql", false);	
					StrWrite.Write( strA );	
					StrWrite.Close();

                    StrWrite = new StreamWriter("Triggers " + obj.Name + "B.sql", false);	
					StrWrite.Write( strB );
					StrWrite.Close();
				}
				return strA == strB;
				//return this.TextDefinition == ((StoredProc)obj).TextDefinition;
			}
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
			
			xmlDoc.Load(".\\xTriggers.xml");
			int i = 0;			

			foreach(XmlElement elem in xmlDoc.SelectNodes("Triggers/Rule") )
			{
				strCTRule[i] = elem.InnerXml;
				strCTProcess[i] = elem.GetAttribute("process").ToString();
				
				// ReGex
				// replace
				// input: process Replace  strFind strReplacment				
				// output strClear
				
				if (strCTProcess[i] == "replace" )
				{					
					//strClear = Regex.Replace(strClear,elem.GetAttribute("strFind").ToString(),elem.GetAttribute("strReplacment").ToString(),RegexOptions.IgnoreCase| RegexOptions.Multiline|RegexOptions.ECMAScript);		
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
