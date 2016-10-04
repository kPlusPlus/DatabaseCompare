using System;
using System.Collections;
using System.Data.SqlClient;

using System.Text;
using System.Xml;
using System.IO;


namespace DatabaseCompare.Domain
{
	/// <summary>
	///	ki: 17-2-2007
	/// sve funkcije i objekti za 
	/// komparaciju baza
	/// </summary>
	public class Database
	{
		public string connString;
		public Hashtable userTables;
		public Hashtable views;
		public Hashtable storedProcs;
		public Hashtable functions;
		public Hashtable triggers;
		public string appPath;

		public Boolean boCheckTriggers = true;
		public Boolean boCheckStoreProcedure = true;
		public Boolean boCheckFunctions = true;
		public Boolean boCheckTables = true;
		public Boolean boCheckViews = true;
		public Boolean boCheckEnc = true;		

		public Database( string connString )
		{
			this.connString = connString;
			this.userTables = new Hashtable();
			this.views = new Hashtable();
			this.storedProcs = new Hashtable();
			this.functions = new Hashtable();
			this.triggers = new Hashtable();
		}

		public Hashtable UserTables
		{
			get { return userTables; }
			set { userTables = value; }
		}

		public Hashtable Views
		{
			get { return views; }
			set { views = value; }
		}

		public Hashtable StoredProcs
		{
			get { return storedProcs; }
			set { storedProcs = value; }
		}

		public Hashtable Functions
		{
			get { return functions; }
			set { functions = value; }
		}

		public Hashtable Triggers
		{
			get { return triggers; }
			set { triggers = value; }
		}

		public string AppPath
		{
			get { return appPath; }
			set { appPath = value; }
		}

		public bool TestConnection()
		{
			try
			{
				using ( SqlConnection conn = new SqlConnection( connString ) )
				{
					conn.Open();
					using ( SqlCommand command = conn.CreateCommand() )
					{
						command.CommandText = "select count(*) from sysobjects";
						object o = command.ExecuteScalar();
						if ( o == null || o == DBNull.Value )
							return false;
						int i = (int)o;
						if ( i <= 0 )
							return false;
					}
					conn.Close();
				}
			}
				//            catch ( Exception ex )
			catch
			{
				return false;
			}
			return true;
		}

		public void LoadObjects()
		{
			try
			{
				using ( SqlConnection conn = new SqlConnection( connString ) )
				{
					conn.Open();
					using ( SqlCommand command = conn.CreateCommand() )
					{
						// get the tables
						command.CommandText = "select name, id from sysobjects where xtype='U'";
						using( SqlDataReader reader = command.ExecuteReader() )
						{
							while( reader.Read() )
							{
								UserTable t = new UserTable( reader.GetString( 0 ), reader.GetInt32( 1 ) );
								userTables[t.Name] = t;
							}
						}

						// get the views
						command.CommandText = "select name, id from sysobjects where xtype='V' and category=0";
						using( SqlDataReader reader = command.ExecuteReader() )
						{
							while( reader.Read() )
							{
								View v = new View( reader.GetString( 0 ), reader.GetInt32( 1 ) );
								views[v.Name] = v;
							}
						}

						// get the stored procs
						command.CommandText = "select name, id from sysobjects where xtype='P' and category=0";
						using( SqlDataReader reader = command.ExecuteReader() )
						{
							while( reader.Read() )
							{
								StoredProc sp = new StoredProc( reader.GetString( 0 ), reader.GetInt32( 1 ) );
								storedProcs[sp.Name] = sp;
							}
						}

						// get the functions
						command.CommandText = "select name, id from sysobjects where xtype='FN' and category=0";
						using( SqlDataReader reader = command.ExecuteReader() )
						{
							while( reader.Read() )
							{
								Function f = new Function( reader.GetString( 0 ), reader.GetInt32( 1 ) );
								functions[f.Name] = f;
							}
						}
/**/
						// get the triggers						
						command.CommandText = "select name, id from sysobjects where xtype='TR' and category=0";
						using( SqlDataReader reader = command.ExecuteReader() )
						{
							while( reader.Read() )
							{
				
								Triggers tr = new Triggers( reader.GetString( 0 ), reader.GetInt32( 1 ) );																
								triggers[tr.Name] = tr;
							}
						}
/**/
					}
					// gather the data for the tables, views, procs and functions
					foreach( UserTable t in userTables.Values )
						t.GatherData( conn );
					foreach( View v in views.Values )
						v.GatherData( conn );
					foreach( StoredProc sp in storedProcs.Values )
						sp.GatherData( conn );
					foreach( Function f in functions.Values )
						f.GatherData( conn );
					foreach ( Triggers tr in triggers.Values )
						tr.GatherData ( conn );

					conn.Close();
				}
			}
			catch ( Exception ex )
			{
				throw ex;
			}
		}

		public ArrayList CompareTo( Database db2 )
		{
			ArrayList diffs = new ArrayList();
			if (boCheckTables)
				CompareObjects( this.UserTables, db2.UserTables, "Table", diffs );
			if (boCheckViews)
				CompareObjects( this.Views, db2.Views, "View", diffs );			
			if (boCheckStoreProcedure)
				CompareObjects( this.StoredProcs, db2.StoredProcs, "StoredProc", diffs );
			if (boCheckFunctions)
				CompareObjects( this.Functions, db2.Functions, "Function", diffs );
			if(boCheckTriggers)
				CompareObjects( this.Triggers, db2.Triggers, "Triggers", diffs );
			

			return diffs;
		}

		public void CompareObjects( Hashtable ht1, Hashtable ht2, string type, ArrayList diffs )
		{
			foreach( DatabaseObject t in ht1.Values )
			{
				if ( ht2[t.Name] == null )
				{
					diffs.Add( new DBDifference( type, t.Name, "Missing in Database 2" ) );
				}
			}
			foreach( DatabaseObject t in ht2.Values )
			{
				if ( ht1[t.Name] == null )
				{
					diffs.Add( new DBDifference( type, t.Name, "Missing in Database 1" ) );
				}
			}
			foreach( DatabaseObject t in ht1.Values )
			{
				DatabaseObject o = ht2[t.Name] as DatabaseObject;
				if ( o != null )
				{
					if ( !t.CompareTo( o ) )
					{
						diffs.Add( new DBDifference( type, t.Name, "Different" ) );
					}
				}
			}
		}		
	}
}
