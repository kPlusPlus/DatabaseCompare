using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

using System.Collections.Specialized;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;

namespace DatabaseCompare
{
    public partial class CheckTables : Form
    {
        public CheckTables()
        {
            InitializeComponent();
        }

        private void btnCheck_Click(object sender, EventArgs e)
        {
            // prvo provjeri konekciju


            // potom provjeri dotiènu bazu

            Server server = new Server(txtServer1.Text);
            DatabaseCollection dbs = server.Databases;
            
            Database db = dbs[txtDB1.Text];
            //db.UserName = txtUN1.Text;            

        }
    }
}