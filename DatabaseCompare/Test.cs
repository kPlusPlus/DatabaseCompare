using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DatabaseCompare.Domain;

namespace DatabaseCompare
{
    public partial class Test : Form
    {
        public Test()
        {
            InitializeComponent();
        }

        private void btnTextRegex_Click(object sender, EventArgs e)
        {
            // testiram parsiranje izraza
            StoredProc sp = new StoredProc("neka",1);
            textBox2.Text =  sp.clearString(textBox1.Text);
        }

    }
}