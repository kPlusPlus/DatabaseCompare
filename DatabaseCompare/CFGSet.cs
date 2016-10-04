using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using System.Configuration;
using System.Drawing;

namespace DatabaseCompare
{
    class CFGSet
    {
        AppSettingsReader appSetReader = new AppSettingsReader();
        public string strValue = "";


        public void Procitaj(string strKey)
        {
            strValue = (string) appSetReader.GetValue(strKey, strValue.GetType() );                                    
            MessageBox.Show( strValue );                        
        }       
        
        
        
    }
}
