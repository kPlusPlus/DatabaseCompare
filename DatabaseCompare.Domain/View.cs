using System;
using System.Collections;
using System.Data.SqlClient;

namespace DatabaseCompare.Domain
{
	/// <summary>
	/// Summary description for View.
	/// </summary>
	public class View : DatabaseObject
	{
        private string textDefinition;
        
	    public View( string name, int id ) : base( name, id )
	    {
	    }

        public override void GatherData( SqlConnection conn )
        {
            base.GatherData( conn );
            using( SqlCommand command = conn.CreateCommand() )
            {
                //command.CommandText = "select text from syscomments where id=@id and text != null";
                command.CommandText = "select text from syscomments where id=@id and encrypted = 0";                
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
			string strA,strB;

			strA = this.TextDefinition;
			strB = ((View)obj).TextDefinition;			

			if ( obj is View )
			{
				// ako a nije b ispiši na ekranu ime pogleda i razlike

				return strA == strB;
				//return this.TextDefinition == ((View)obj).TextDefinition;
			}
                
            return false;
        }


	}
}
