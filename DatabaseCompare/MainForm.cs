using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Windows.Forms;
using DatabaseCompare.Domain;
using System.IO;
using System.Xml;
using System.Xml.XPath;

using System.Configuration;
//using Algorithm.Diff;
using DifferenceEngine;

using System.Runtime.InteropServices;





namespace DatabaseCompare
{
	/// <summary>
	/// Summary description for MainForm.
	/// </summary>
	public class MainForm : System.Windows.Forms.Form
	{
        delegate void UIHelperDelegate(Boolean working);
        delegate void StatusDelegate(string statusMessage);		

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtServer1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.CheckBox chkSSPI1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtUN1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtP1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtP2;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtUN2;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.CheckBox chkSSPI2;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtDB2;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtServer2;
        private System.Windows.Forms.Button btnTestConnections;
        private System.Windows.Forms.TextBox txtDB1;
        private IContainer components;

        private string connString1 = "";
        private string connString2 = "";

        private Database db1;
		private Database db2;

        public StreamReader StrReader;

        private System.Windows.Forms.Button btnCompareDatabases;
        private System.Windows.Forms.StatusBar statusBar;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        public ListView lvDifferences;
        private System.Windows.Forms.Button btnChangeScript;
		private System.Windows.Forms.CheckBox chkBoxStoreProcedure;
		private System.Windows.Forms.CheckBox chkBoxFunction;
		private System.Windows.Forms.CheckBox chkBoxTriggers;
		private System.Windows.Forms.CheckBox chkBoxView;
        private System.Windows.Forms.CheckBox chkBoxTable;
		private System.Windows.Forms.CheckBox chkBoxEnc;
        private Button btnTest;
        public RichTextBox rtbSideA;
        public RichTextBox rtbSideB;
        public bool rtbSideAChange = false;
        public bool rtbSideBChange = false;
        public String inputLanguage;
        public XmlDocument xmlDoc;
        public ArrayList arrKey = new ArrayList();
        public ArrayList arrComp = new ArrayList();
        public ArrayList arrOper = new ArrayList();

        private Int32 intCountStore = 0;
        private Int32 intCountTrigger = 0;
        private Int32 intCountTable = 0;
        private Int32 intCountView = 0;
        private Label lblNoTrigger;
        private Label lblNoFuntion;
        private Label lblNoStore;
        private Label lblNoTable;
        private Label lblNoView;
        public Button btnDiff;
        public ListView lvSource;
        private ColumnHeader columnHeader4;
        private ColumnHeader columnHeader5;
        public ListView lvDestination;
        private ColumnHeader columnHeader6;
        private ColumnHeader columnHeader7;
        private Int32 intCountFunction = 0;
        private ColumnHeader columnHeader8;
        private TableLayoutPanel tableLayoutPanel1;
        private Label lblScanObj;

        // diff
        private DiffEngineLevel _level;


        // multi - scroll
        [DllImport("user32.dll")]
        private static extern int GetScrollPos(IntPtr hWnd, int nBar);
        private const Int32 SBS_VERT = 1;
        private const Int32 SB_THUMBPOSITION = 4;
        private const Int32 WM_VSCROLL = 277;
        [DllImport("user32.dll", EntryPoint = "PostMessageA")]
        public static extern Int32 PostMessage(IntPtr hWnd, Int32 wMsg, Int32 wParam, Int32 lParam);
        [DllImport("user32.dll", EntryPoint = "PostMessageA")]
        public static extern Int32 PostMessage(IntPtr hWnd, Int32 wMsg, uint wParam, uint lParam);

        private Boolean boMouseOverSideA = false;
        private Boolean boMouseOverSideB = false;
        private Boolean boMouseOverDiffA = false;
        private Boolean boMouseOverDiffB = false;
        private CFGSet CFG = new CFGSet();

		public MainForm()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();		
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            System.Configuration.AppSettingsReader configurationAppSettings = new System.Configuration.AppSettingsReader();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtP1 = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtUN1 = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.chkSSPI1 = new System.Windows.Forms.CheckBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtDB1 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtServer1 = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txtP2 = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.txtUN2 = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.chkSSPI2 = new System.Windows.Forms.CheckBox();
            this.label9 = new System.Windows.Forms.Label();
            this.txtDB2 = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txtServer2 = new System.Windows.Forms.TextBox();
            this.btnTestConnections = new System.Windows.Forms.Button();
            this.btnCompareDatabases = new System.Windows.Forms.Button();
            this.statusBar = new System.Windows.Forms.StatusBar();
            this.lvDifferences = new System.Windows.Forms.ListView();
            this.columnHeader1 = new System.Windows.Forms.ColumnHeader();
            this.columnHeader2 = new System.Windows.Forms.ColumnHeader();
            this.columnHeader3 = new System.Windows.Forms.ColumnHeader();
            this.columnHeader8 = new System.Windows.Forms.ColumnHeader();
            this.btnChangeScript = new System.Windows.Forms.Button();
            this.chkBoxStoreProcedure = new System.Windows.Forms.CheckBox();
            this.chkBoxFunction = new System.Windows.Forms.CheckBox();
            this.chkBoxTriggers = new System.Windows.Forms.CheckBox();
            this.chkBoxView = new System.Windows.Forms.CheckBox();
            this.chkBoxTable = new System.Windows.Forms.CheckBox();
            this.lblNoTable = new System.Windows.Forms.Label();
            this.lblNoView = new System.Windows.Forms.Label();
            this.lblNoTrigger = new System.Windows.Forms.Label();
            this.lblNoFuntion = new System.Windows.Forms.Label();
            this.lblNoStore = new System.Windows.Forms.Label();
            this.chkBoxEnc = new System.Windows.Forms.CheckBox();
            this.btnTest = new System.Windows.Forms.Button();
            this.rtbSideA = new System.Windows.Forms.RichTextBox();
            this.rtbSideB = new System.Windows.Forms.RichTextBox();
            this.btnDiff = new System.Windows.Forms.Button();
            this.lvSource = new System.Windows.Forms.ListView();
            this.columnHeader4 = new System.Windows.Forms.ColumnHeader();
            this.columnHeader5 = new System.Windows.Forms.ColumnHeader();
            this.lvDestination = new System.Windows.Forms.ListView();
            this.columnHeader6 = new System.Windows.Forms.ColumnHeader();
            this.columnHeader7 = new System.Windows.Forms.ColumnHeader();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.lblScanObj = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.BackgroundImage = global::DatabaseCompare.Properties.Resources.ClipBoard1;
            this.groupBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.txtP1);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.txtUN1);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.chkSSPI1);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.txtDB1);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txtServer1);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(249, 167);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Database 1 (ref. db)";
            // 
            // label5
            // 
            this.label5.Location = new System.Drawing.Point(10, 129);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(67, 19);
            this.label5.TabIndex = 9;
            this.label5.Text = "Password";
            // 
            // txtP1
            // 
            this.txtP1.Location = new System.Drawing.Point(115, 129);
            this.txtP1.Name = "txtP1";
            this.txtP1.Size = new System.Drawing.Size(120, 22);
            this.txtP1.TabIndex = 8;
            this.txtP1.Text = ((string)(configurationAppSettings.GetValue("txtP1.Text", typeof(string))));
            this.txtP1.UseSystemPasswordChar = true;
            // 
            // label4
            // 
            this.label4.Location = new System.Drawing.Point(10, 102);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(86, 18);
            this.label4.TabIndex = 7;
            this.label4.Text = "User Name";
            // 
            // txtUN1
            // 
            this.txtUN1.Location = new System.Drawing.Point(115, 102);
            this.txtUN1.Name = "txtUN1";
            this.txtUN1.Size = new System.Drawing.Size(120, 22);
            this.txtUN1.TabIndex = 6;
            this.txtUN1.Text = ((string)(configurationAppSettings.GetValue("txtUN1.Text", typeof(string))));
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(10, 78);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(96, 19);
            this.label3.TabIndex = 5;
            this.label3.Text = "Use Integrated";
            // 
            // chkSSPI1
            // 
            this.chkSSPI1.Checked = ((bool)(configurationAppSettings.GetValue("chkSSPI1.Checked", typeof(bool))));
            this.chkSSPI1.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkSSPI1.Location = new System.Drawing.Point(115, 74);
            this.chkSSPI1.Name = "chkSSPI1";
            this.chkSSPI1.Size = new System.Drawing.Size(125, 28);
            this.chkSSPI1.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(10, 46);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(67, 19);
            this.label2.TabIndex = 3;
            this.label2.Text = "Database";
            // 
            // txtDB1
            // 
            this.txtDB1.Location = new System.Drawing.Point(115, 46);
            this.txtDB1.Name = "txtDB1";
            this.txtDB1.Size = new System.Drawing.Size(120, 22);
            this.txtDB1.TabIndex = 2;
            this.txtDB1.Text = ((string)(configurationAppSettings.GetValue("txtDB1.Text", typeof(string))));
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(10, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(48, 19);
            this.label1.TabIndex = 1;
            this.label1.Text = "Server";
            // 
            // txtServer1
            // 
            this.txtServer1.Location = new System.Drawing.Point(115, 18);
            this.txtServer1.Name = "txtServer1";
            this.txtServer1.Size = new System.Drawing.Size(120, 22);
            this.txtServer1.TabIndex = 0;
            this.txtServer1.Text = ((string)(configurationAppSettings.GetValue("txtServer1.Text", typeof(string))));
            // 
            // groupBox2
            // 
            this.groupBox2.BackColor = System.Drawing.Color.Transparent;
            this.groupBox2.BackgroundImage = global::DatabaseCompare.Properties.Resources.ClipBoard1;
            this.groupBox2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.txtP2);
            this.groupBox2.Controls.Add(this.label7);
            this.groupBox2.Controls.Add(this.txtUN2);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Controls.Add(this.chkSSPI2);
            this.groupBox2.Controls.Add(this.label9);
            this.groupBox2.Controls.Add(this.txtDB2);
            this.groupBox2.Controls.Add(this.label10);
            this.groupBox2.Controls.Add(this.txtServer2);
            this.groupBox2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.groupBox2.Location = new System.Drawing.Point(274, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(249, 167);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Database 2";
            // 
            // label6
            // 
            this.label6.Location = new System.Drawing.Point(10, 129);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(67, 19);
            this.label6.TabIndex = 9;
            this.label6.Text = "Password";
            // 
            // txtP2
            // 
            this.txtP2.Location = new System.Drawing.Point(115, 129);
            this.txtP2.Name = "txtP2";
            this.txtP2.Size = new System.Drawing.Size(120, 22);
            this.txtP2.TabIndex = 8;
            this.txtP2.Text = ((string)(configurationAppSettings.GetValue("txtP2.Text", typeof(string))));
            this.txtP2.UseSystemPasswordChar = true;
            // 
            // label7
            // 
            this.label7.Location = new System.Drawing.Point(10, 102);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(86, 18);
            this.label7.TabIndex = 7;
            this.label7.Text = "User Name";
            // 
            // txtUN2
            // 
            this.txtUN2.Location = new System.Drawing.Point(115, 102);
            this.txtUN2.Name = "txtUN2";
            this.txtUN2.Size = new System.Drawing.Size(120, 22);
            this.txtUN2.TabIndex = 6;
            this.txtUN2.Text = ((string)(configurationAppSettings.GetValue("txtUN2.Text", typeof(string))));
            // 
            // label8
            // 
            this.label8.Location = new System.Drawing.Point(10, 78);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(96, 19);
            this.label8.TabIndex = 5;
            this.label8.Text = "Use Integrated";
            // 
            // chkSSPI2
            // 
            this.chkSSPI2.Checked = ((bool)(configurationAppSettings.GetValue("chkSSPI2.Checked", typeof(bool))));
            this.chkSSPI2.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkSSPI2.Location = new System.Drawing.Point(115, 74);
            this.chkSSPI2.Name = "chkSSPI2";
            this.chkSSPI2.Size = new System.Drawing.Size(125, 28);
            this.chkSSPI2.TabIndex = 4;
            // 
            // label9
            // 
            this.label9.Location = new System.Drawing.Point(10, 46);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(67, 19);
            this.label9.TabIndex = 3;
            this.label9.Text = "Database";
            // 
            // txtDB2
            // 
            this.txtDB2.Location = new System.Drawing.Point(115, 46);
            this.txtDB2.Name = "txtDB2";
            this.txtDB2.Size = new System.Drawing.Size(120, 22);
            this.txtDB2.TabIndex = 2;
            this.txtDB2.Text = ((string)(configurationAppSettings.GetValue("txtDB2.Text", typeof(string))));
            // 
            // label10
            // 
            this.label10.Location = new System.Drawing.Point(10, 18);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(48, 19);
            this.label10.TabIndex = 1;
            this.label10.Text = "Server";
            // 
            // txtServer2
            // 
            this.txtServer2.Location = new System.Drawing.Point(115, 18);
            this.txtServer2.Name = "txtServer2";
            this.txtServer2.Size = new System.Drawing.Size(120, 22);
            this.txtServer2.TabIndex = 0;
            this.txtServer2.Text = ((string)(configurationAppSettings.GetValue("txtServer2.Text", typeof(string))));
            // 
            // btnTestConnections
            // 
            this.btnTestConnections.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnTestConnections.BackgroundImage")));
            this.btnTestConnections.Location = new System.Drawing.Point(274, 185);
            this.btnTestConnections.Name = "btnTestConnections";
            this.btnTestConnections.Size = new System.Drawing.Size(120, 26);
            this.btnTestConnections.TabIndex = 2;
            this.btnTestConnections.Text = "Test";
            this.btnTestConnections.Click += new System.EventHandler(this.btnTestConnections_Click);
            // 
            // btnCompareDatabases
            // 
            this.btnCompareDatabases.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnCompareDatabases.BackgroundImage")));
            this.btnCompareDatabases.Enabled = false;
            this.btnCompareDatabases.Location = new System.Drawing.Point(404, 185);
            this.btnCompareDatabases.Name = "btnCompareDatabases";
            this.btnCompareDatabases.Size = new System.Drawing.Size(119, 26);
            this.btnCompareDatabases.TabIndex = 3;
            this.btnCompareDatabases.Text = "Compare";
            this.btnCompareDatabases.Click += new System.EventHandler(this.btnCompareDatabases_Click);
            // 
            // statusBar
            // 
            this.statusBar.Location = new System.Drawing.Point(0, 678);
            this.statusBar.Name = "statusBar";
            this.statusBar.Size = new System.Drawing.Size(993, 30);
            this.statusBar.TabIndex = 4;
            // 
            // lvDifferences
            // 
            this.lvDifferences.AllowColumnReorder = true;
            this.lvDifferences.BackColor = System.Drawing.Color.NavajoWhite;
            this.lvDifferences.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader3,
            this.columnHeader8});
            this.lvDifferences.Enabled = false;
            this.lvDifferences.FullRowSelect = true;
            this.lvDifferences.Location = new System.Drawing.Point(528, 12);
            this.lvDifferences.Name = "lvDifferences";
            this.lvDifferences.Size = new System.Drawing.Size(453, 241);
            this.lvDifferences.TabIndex = 5;
            this.lvDifferences.UseCompatibleStateImageBehavior = false;
            this.lvDifferences.View = System.Windows.Forms.View.Details;
            this.lvDifferences.SelectedIndexChanged += new System.EventHandler(this.lvDifferences_SelectedIndexChanged);
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Type";
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Name";
            this.columnHeader2.Width = 151;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Status";
            this.columnHeader3.Width = 137;
            // 
            // columnHeader8
            // 
            this.columnHeader8.Text = "Pica";
            this.columnHeader8.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // btnChangeScript
            // 
            this.btnChangeScript.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnChangeScript.BackgroundImage")));
            this.btnChangeScript.Enabled = false;
            this.btnChangeScript.Location = new System.Drawing.Point(752, 257);
            this.btnChangeScript.Name = "btnChangeScript";
            this.btnChangeScript.Size = new System.Drawing.Size(229, 29);
            this.btnChangeScript.TabIndex = 6;
            this.btnChangeScript.Text = "Get Change Script";
            this.btnChangeScript.Click += new System.EventHandler(this.btnChangeScript_Click);
            // 
            // chkBoxStoreProcedure
            // 
            this.chkBoxStoreProcedure.Checked = ((bool)(configurationAppSettings.GetValue("chkBoxStoreProcedure.Checked", typeof(bool))));
            this.chkBoxStoreProcedure.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkBoxStoreProcedure.Location = new System.Drawing.Point(13, 63);
            this.chkBoxStoreProcedure.Name = "chkBoxStoreProcedure";
            this.chkBoxStoreProcedure.Size = new System.Drawing.Size(140, 14);
            this.chkBoxStoreProcedure.TabIndex = 9;
            this.chkBoxStoreProcedure.Text = "Store Procedure";
            // 
            // chkBoxFunction
            // 
            this.chkBoxFunction.Checked = ((bool)(configurationAppSettings.GetValue("chkBoxFunction.Checked", typeof(bool))));
            this.chkBoxFunction.Location = new System.Drawing.Point(13, 83);
            this.chkBoxFunction.Name = "chkBoxFunction";
            this.chkBoxFunction.Size = new System.Drawing.Size(140, 14);
            this.chkBoxFunction.TabIndex = 10;
            this.chkBoxFunction.Text = "Function";
            // 
            // chkBoxTriggers
            // 
            this.chkBoxTriggers.Checked = ((bool)(configurationAppSettings.GetValue("chkBoxTriggers.Checked", typeof(bool))));
            this.chkBoxTriggers.Location = new System.Drawing.Point(13, 103);
            this.chkBoxTriggers.Name = "chkBoxTriggers";
            this.chkBoxTriggers.Size = new System.Drawing.Size(140, 14);
            this.chkBoxTriggers.TabIndex = 11;
            this.chkBoxTriggers.Text = "Triggers";
            // 
            // chkBoxView
            // 
            this.chkBoxView.Checked = ((bool)(configurationAppSettings.GetValue("chkBoxView.Checked", typeof(bool))));
            this.chkBoxView.Location = new System.Drawing.Point(13, 123);
            this.chkBoxView.Name = "chkBoxView";
            this.chkBoxView.Size = new System.Drawing.Size(140, 14);
            this.chkBoxView.TabIndex = 12;
            this.chkBoxView.Text = "View";
            // 
            // chkBoxTable
            // 
            this.chkBoxTable.Checked = ((bool)(configurationAppSettings.GetValue("chkBoxTable.Checked", typeof(bool))));
            this.chkBoxTable.Location = new System.Drawing.Point(13, 143);
            this.chkBoxTable.Name = "chkBoxTable";
            this.chkBoxTable.Size = new System.Drawing.Size(140, 14);
            this.chkBoxTable.TabIndex = 13;
            this.chkBoxTable.Text = "Table";
            // 
            // lblNoTable
            // 
            this.lblNoTable.AutoSize = true;
            this.lblNoTable.BackColor = System.Drawing.Color.Silver;
            this.lblNoTable.Location = new System.Drawing.Point(159, 140);
            this.lblNoTable.Name = "lblNoTable";
            this.lblNoTable.Size = new System.Drawing.Size(46, 20);
            this.lblNoTable.TabIndex = 18;
            this.lblNoTable.Text = "label11";
            this.lblNoTable.Visible = false;
            // 
            // lblNoView
            // 
            this.lblNoView.AutoSize = true;
            this.lblNoView.BackColor = System.Drawing.Color.Silver;
            this.lblNoView.Location = new System.Drawing.Point(159, 120);
            this.lblNoView.Name = "lblNoView";
            this.lblNoView.Size = new System.Drawing.Size(46, 20);
            this.lblNoView.TabIndex = 18;
            this.lblNoView.Text = "label11";
            this.lblNoView.Visible = false;
            // 
            // lblNoTrigger
            // 
            this.lblNoTrigger.AutoSize = true;
            this.lblNoTrigger.BackColor = System.Drawing.Color.Silver;
            this.lblNoTrigger.Location = new System.Drawing.Point(159, 100);
            this.lblNoTrigger.Name = "lblNoTrigger";
            this.lblNoTrigger.Size = new System.Drawing.Size(46, 20);
            this.lblNoTrigger.TabIndex = 18;
            this.lblNoTrigger.Text = "label11";
            this.lblNoTrigger.Visible = false;
            // 
            // lblNoFuntion
            // 
            this.lblNoFuntion.AutoSize = true;
            this.lblNoFuntion.BackColor = System.Drawing.Color.Silver;
            this.lblNoFuntion.Location = new System.Drawing.Point(159, 80);
            this.lblNoFuntion.Name = "lblNoFuntion";
            this.lblNoFuntion.Size = new System.Drawing.Size(46, 20);
            this.lblNoFuntion.TabIndex = 18;
            this.lblNoFuntion.Text = "label11";
            this.lblNoFuntion.Visible = false;
            // 
            // lblNoStore
            // 
            this.lblNoStore.AutoSize = true;
            this.lblNoStore.BackColor = System.Drawing.Color.Silver;
            this.lblNoStore.Location = new System.Drawing.Point(159, 60);
            this.lblNoStore.Name = "lblNoStore";
            this.lblNoStore.Size = new System.Drawing.Size(46, 20);
            this.lblNoStore.TabIndex = 15;
            this.lblNoStore.Text = "label11";
            this.lblNoStore.Visible = false;
            // 
            // chkBoxEnc
            // 
            this.chkBoxEnc.Checked = ((bool)(configurationAppSettings.GetValue("chkBoxEnc.Checked", typeof(bool))));
            this.chkBoxEnc.Location = new System.Drawing.Point(13, 163);
            this.chkBoxEnc.Name = "chkBoxEnc";
            this.chkBoxEnc.Size = new System.Drawing.Size(140, 14);
            this.chkBoxEnc.TabIndex = 14;
            this.chkBoxEnc.Text = "Encrypted";
            this.chkBoxEnc.Visible = false;
            // 
            // btnTest
            // 
            this.btnTest.Image = global::DatabaseCompare.Properties.Resources.tipka;
            this.btnTest.Location = new System.Drawing.Point(913, 514);
            this.btnTest.Name = "btnTest";
            this.btnTest.Size = new System.Drawing.Size(66, 28);
            this.btnTest.TabIndex = 15;
            this.btnTest.Text = "test";
            this.btnTest.UseVisualStyleBackColor = true;
            this.btnTest.Visible = false;
            this.btnTest.Click += new System.EventHandler(this.btnTest_Click);
            // 
            // rtbSideA
            // 
            this.rtbSideA.BackColor = System.Drawing.Color.NavajoWhite;
            this.rtbSideA.Location = new System.Drawing.Point(0, 257);
            this.rtbSideA.Name = "rtbSideA";
            this.rtbSideA.Size = new System.Drawing.Size(370, 251);
            this.rtbSideA.TabIndex = 16;
            this.rtbSideA.Text = "";
            this.rtbSideA.WordWrap = false;
            this.rtbSideA.DoubleClick += new System.EventHandler(this.rtbSideA_DoubleClick);
            this.rtbSideA.MouseLeave += new System.EventHandler(this.rtbSideA_MouseLeave);
            this.rtbSideA.VScroll += new System.EventHandler(this.rtbSideA_VScroll);
            this.rtbSideA.KeyUp += new System.Windows.Forms.KeyEventHandler(this.rtbSideA_KeyUp);
            this.rtbSideA.TextChanged += new System.EventHandler(this.rtbSideA_TextChanged);
            this.rtbSideA.MouseHover += new System.EventHandler(this.rtbSideA_MouseHover);
            // 
            // rtbSideB
            // 
            this.rtbSideB.BackColor = System.Drawing.Color.NavajoWhite;
            this.rtbSideB.Location = new System.Drawing.Point(376, 258);
            this.rtbSideB.Name = "rtbSideB";
            this.rtbSideB.Size = new System.Drawing.Size(370, 251);
            this.rtbSideB.TabIndex = 17;
            this.rtbSideB.Text = "";
            this.rtbSideB.WordWrap = false;
            this.rtbSideB.DoubleClick += new System.EventHandler(this.rtbSideB_DoubleClick);
            this.rtbSideB.MouseLeave += new System.EventHandler(this.rtbSideB_MouseLeave);
            this.rtbSideB.VScroll += new System.EventHandler(this.rtbSideB_VScroll);
            this.rtbSideB.KeyUp += new System.Windows.Forms.KeyEventHandler(this.rtbSideB_KeyUp);
            this.rtbSideB.TextChanged += new System.EventHandler(this.rtbSideB_TextChanged);
            this.rtbSideB.MouseHover += new System.EventHandler(this.rtbSideB_MouseHover);
            // 
            // btnDiff
            // 
            this.btnDiff.BackgroundImage = global::DatabaseCompare.Properties.Resources.tipka;
            this.btnDiff.ImageKey = "(none)";
            this.btnDiff.Location = new System.Drawing.Point(145, 514);
            this.btnDiff.Name = "btnDiff";
            this.btnDiff.Size = new System.Drawing.Size(448, 27);
            this.btnDiff.TabIndex = 18;
            this.btnDiff.Text = "Differences";
            this.btnDiff.UseVisualStyleBackColor = true;
            this.btnDiff.Click += new System.EventHandler(this.btnDiff_Click);
            // 
            // lvSource
            // 
            this.lvSource.BackColor = System.Drawing.Color.NavajoWhite;
            this.lvSource.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader4,
            this.columnHeader5});
            this.lvSource.FullRowSelect = true;
            this.lvSource.HideSelection = false;
            this.lvSource.Location = new System.Drawing.Point(0, 539);
            this.lvSource.MultiSelect = false;
            this.lvSource.Name = "lvSource";
            this.lvSource.Size = new System.Drawing.Size(370, 134);
            this.lvSource.TabIndex = 19;
            this.lvSource.UseCompatibleStateImageBehavior = false;
            this.lvSource.View = System.Windows.Forms.View.Details;
            this.lvSource.DoubleClick += new System.EventHandler(this.lvSource_DoubleClick);
            this.lvSource.SelectedIndexChanged += new System.EventHandler(this.lvSource_SelectedIndexChanged);
            this.lvSource.MouseLeave += new System.EventHandler(this.lvSource_MouseLeave);
            this.lvSource.MouseHover += new System.EventHandler(this.lvSource_MouseHover);
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "Line";
            this.columnHeader4.Width = 50;
            // 
            // columnHeader5
            // 
            this.columnHeader5.Text = "Text (Source)";
            this.columnHeader5.Width = 315;
            // 
            // lvDestination
            // 
            this.lvDestination.BackColor = System.Drawing.Color.NavajoWhite;
            this.lvDestination.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader6,
            this.columnHeader7});
            this.lvDestination.FullRowSelect = true;
            this.lvDestination.HideSelection = false;
            this.lvDestination.Location = new System.Drawing.Point(376, 539);
            this.lvDestination.MultiSelect = false;
            this.lvDestination.Name = "lvDestination";
            this.lvDestination.Size = new System.Drawing.Size(370, 134);
            this.lvDestination.TabIndex = 20;
            this.lvDestination.UseCompatibleStateImageBehavior = false;
            this.lvDestination.View = System.Windows.Forms.View.Details;
            this.lvDestination.SelectedIndexChanged += new System.EventHandler(this.lvDestination_SelectedIndexChanged);
            // 
            // columnHeader6
            // 
            this.columnHeader6.Text = "Line";
            this.columnHeader6.Width = 50;
            // 
            // columnHeader7
            // 
            this.columnHeader7.Text = "Text (Destination)";
            this.columnHeader7.Width = 315;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.BackgroundImage = global::DatabaseCompare.Properties.Resources.ClipBoard1;
            this.tableLayoutPanel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.tableLayoutPanel1.ColumnCount = 4;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 10F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 146F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 55F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 17F));
            this.tableLayoutPanel1.Controls.Add(this.chkBoxEnc, 1, 8);
            this.tableLayoutPanel1.Controls.Add(this.lblNoTable, 2, 7);
            this.tableLayoutPanel1.Controls.Add(this.chkBoxStoreProcedure, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.lblNoView, 2, 6);
            this.tableLayoutPanel1.Controls.Add(this.lblNoStore, 2, 3);
            this.tableLayoutPanel1.Controls.Add(this.lblNoTrigger, 2, 5);
            this.tableLayoutPanel1.Controls.Add(this.chkBoxFunction, 1, 4);
            this.tableLayoutPanel1.Controls.Add(this.chkBoxView, 1, 6);
            this.tableLayoutPanel1.Controls.Add(this.lblNoFuntion, 2, 4);
            this.tableLayoutPanel1.Controls.Add(this.chkBoxTriggers, 1, 5);
            this.tableLayoutPanel1.Controls.Add(this.chkBoxTable, 1, 7);
            this.tableLayoutPanel1.Controls.Add(this.lblScanObj, 1, 0);
            this.tableLayoutPanel1.Location = new System.Drawing.Point(753, 292);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 12;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(228, 211);
            this.tableLayoutPanel1.TabIndex = 21;
            // 
            // lblScanObj
            // 
            this.lblScanObj.AutoSize = true;
            this.lblScanObj.BackColor = System.Drawing.Color.Transparent;
            this.lblScanObj.Location = new System.Drawing.Point(13, 0);
            this.lblScanObj.Name = "lblScanObj";
            this.lblScanObj.Size = new System.Drawing.Size(82, 17);
            this.lblScanObj.TabIndex = 19;
            this.lblScanObj.Text = "Scan object";
            // 
            // MainForm
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(6, 15);
            this.BackgroundImage = global::DatabaseCompare.Properties.Resources.background;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(993, 708);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Controls.Add(this.lvDestination);
            this.Controls.Add(this.lvSource);
            this.Controls.Add(this.btnDiff);
            this.Controls.Add(this.rtbSideB);
            this.Controls.Add(this.rtbSideA);
            this.Controls.Add(this.btnTest);
            this.Controls.Add(this.lvDifferences);
            this.Controls.Add(this.statusBar);
            this.Controls.Add(this.btnCompareDatabases);
            this.Controls.Add(this.btnTestConnections);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnChangeScript);
            this.Name = "MainForm";
            this.Text = "Database Compare";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.ResumeLayout(false);

		}
		#endregion

        [STAThread]
        static void Main() 
        {
            Application.Run(new MainForm());
        }

        private void btnTestConnections_Click(object sender, System.EventArgs e)
        {
            
            SetDoingLengthyOperation( true );            
			// thread
			//WaitCallback doWork = new WaitCallback( this.DoTestConnections );
            //ThreadPool.QueueUserWorkItem( doWork );
			DoTestConnections( this );
        }

        private void DoTestConnections( object o )
        {
            CreateConnectionStrings( out connString1, out connString2 );	
            db1 = new Database( connString1 );			
            db2 = new Database( connString2 );
            bool b1 = db1.TestConnection();
            bool b2 = db2.TestConnection();
            string s = "";
            if ( !b1 ) 
                s = "Database 1 is configured incorrectly.  Please check the configuration.";
            if ( !b2 )
                s = s.Length == 0 ? "Database 2 is configured incorrectly.  Please check the configuration." : s + "\r\nDatabase 2 is configured incorrectly.  Please check the configuration.";
            if ( !b1 || !b2 )
            {
                SetDoingLengthyOperation( false );
                btnCompareDatabases.Enabled = false;
                MessageBox.Show( s, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error );
                return;
            }
            MessageBox.Show( "Both Connections tested successfully!", "Success" );
            SetDoingLengthyOperation( false );
            btnCompareDatabases.Enabled = true;

        }

        private void CreateConnectionStrings( out string conn1, out string conn2 )
        {
            if ( chkSSPI1.Checked )
                conn1 = string.Format( "Data Source={0};Initial Catalog={1};Integrated Security=SSPI;",
                   txtServer1.Text, txtDB1.Text ); 
            else
                conn1 = string.Format( "Data Source={0};Initial Catalog={1};UId={2};Pwd={3};",
                    txtServer1.Text, txtDB1.Text, txtUN1.Text, txtP1.Text ); 
            if ( chkSSPI2.Checked )
                conn2 = string.Format( "Data Source={0};Initial Catalog={1};Integrated Security=SSPI;",
                   txtServer2.Text, txtDB2.Text ); 
            else
                conn2 = string.Format( "Data Source={0};Initial Catalog={1};UId={2};Pwd={3};",
                    txtServer2.Text, txtDB2.Text, txtUN2.Text, txtP2.Text ); 
        }

        private void btnCompareDatabases_Click(object sender, System.EventArgs e)
        {
            AllClear();
            if (lvDifferences.Items.Count > 0)            
                lvDifferences.Items.Clear();			

			SetDoingLengthyOperation( true );
			// thread
            //WaitCallback doWork = new WaitCallback( this.DoGatherDatabaseData );
            //ThreadPool.QueueUserWorkItem( doWork );
			DoGatherDatabaseData( this );	
        }

        private void DoGatherDatabaseData( object param ) 
        {
            try
            {
                try
                {
                    UpdateStatusBar( "Loading Database 1 objects" );
                    db1.LoadObjects();    
                }
                catch ( Exception ex )
                {
                    MessageBox.Show( "Error loading Database 1 objects:\r\n" + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error );
                    return;
                }   
                try
                {
                    UpdateStatusBar( "Loading Database 2 objects" );
                 db2.LoadObjects();
                }
                catch ( Exception ex )
                {
                    MessageBox.Show( "Error loading Database 2 objects:\r\n" + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error );
                    return;
                } 
                UpdateStatusBar( "Comparing Database objects" );
				// *** compare procedures ***
                
				db1.boCheckFunctions = chkBoxFunction.Checked;				
				db1.boCheckTables = chkBoxTable.Checked;
				db1.boCheckViews = chkBoxView.Checked;
				db1.boCheckStoreProcedure = chkBoxStoreProcedure.Checked;
				db1.boCheckTriggers = chkBoxTriggers.Checked;	
				db1.boCheckEnc = chkBoxEnc.Checked;

                ArrayList differences = db1.CompareTo( db2 );
                differences.Sort();
				
                foreach( DBDifference d in differences )
                {
                    lvDifferences.Items.Add( new ListViewItem( new string[] {d.Type, d.Name, d.Status } ) );

                    if (d.Type == "StoredProc")
                        intCountStore++;
                    if (d.Type == "Function")
                        intCountFunction++;
                    if (d.Type == "Table")
                        intCountTable++;
                    if (d.Type == "View")
                        intCountView++;
                    if (d.Type == "Triggers")
                        intCountTrigger++;
                }

                if (intCountStore > 0)
                {
                    lblNoStore.Visible = true;
                    lblNoStore.Text = intCountStore.ToString();
                }
                else
                {
                    lblNoStore.Visible = false;
                    lblNoStore.Text = intCountStore.ToString();
                }

                if (intCountFunction > 0)
                {
                    lblNoFuntion.Visible = true;
                    lblNoFuntion.Text = intCountFunction.ToString();
                }
                else
                {
                    lblNoFuntion.Visible = false;
                    lblNoFuntion.Text = intCountFunction.ToString();
                }

                if (intCountTable > 0)
                {
                    lblNoTable.Visible = true;
                    lblNoTable.Text = intCountTable.ToString();
                }
                else
                {
                    lblNoTable.Visible = false;
                    lblNoTable.Text = intCountTable.ToString();
                }

                if (intCountView > 0)
                {
                    lblNoView.Visible = true;
                    lblNoView.Text = intCountView.ToString();
                }
                else
                {
                    lblNoView.Visible = false;
                    lblNoView.Text = intCountView.ToString();
                }

                if (intCountTrigger > 0)
                {
                    lblNoTrigger.Visible = true;
                    lblNoTrigger.Text = intCountTrigger.ToString();
                }
                else
                {
                    lblNoTrigger.Visible = false;
                    lblNoTrigger.Text = intCountTrigger.ToString();
                }


                lvDifferences.Enabled = true;
                btnChangeScript.Enabled = true;
                UpdateStatusBar( "" );

            }
            catch ( Exception ex )
            {
                MessageBox.Show( "Error comparing Database objects:\r\n" + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error );
                return;
            }
            finally
            {
                SetDoingLengthyOperation( false );
            }
        }

        void SetDoingLengthyOperation(Boolean working) 
        {
            if (this.InvokeRequired) 
            { 
                UIHelperDelegate setDoingLengthyOperation = new UIHelperDelegate(this.SetDoingLengthyOperation);
                Object[] arguments = new Object[]{working};
                this.Invoke( setDoingLengthyOperation, arguments);
                return;
            }
            btnCompareDatabases.Enabled = !working;
            btnTestConnections.Enabled = !working;
            groupBox1.Enabled = !working;
            groupBox2.Enabled = !working;

            if ( working )
            {
                this.Cursor = Cursors.WaitCursor;
            }
            else
            {
                this.Cursor = Cursors.Default;
            }
        }

        void UpdateStatusBar(string message) 
        {
            if (this.InvokeRequired) 
            { 
                StatusDelegate del = new StatusDelegate(this.UpdateStatusBar);
                Object[] arguments = new Object[]{message};
                this.Invoke( del, arguments);
                return;
            }
            statusBar.Text = message;
        }

        private void btnChangeScript_Click(object sender, System.EventArgs e)
        {            

            if ( lvDifferences.SelectedItems.Count == 0 )
            {
                MessageBox.Show( "Please select some items to build a change script for." );
                return;
            }
            StringBuilder sb = new StringBuilder();
            foreach( ListViewItem li in lvDifferences.SelectedItems )
            {
                if ( li.Text == "Table" )
                {
                    sb.AppendFormat( "\r\n-- Table {0} \r\n-- Type unsupported\r\n", li.SubItems[1].Text );
                }
                else
                {
                    if ( li.SubItems[2].Text == "Different" )
                    {
                        sb.Append( GetDropScript( li.SubItems[1].Text, li.Text ) );
                        sb.Append( "\r\nGO\r\n" );
                        if ( li.Text == "Function")
                            sb.Append( ((Function)db1.Functions[li.SubItems[1].Text]).TextDefinition );
                        if ( li.Text == "View")
                            sb.Append( ((Domain.View)db1.Views[li.SubItems[1].Text]).TextDefinition );
                        if ( li.Text == "StoredProc")
                            sb.Append( ((StoredProc)db1.StoredProcs[li.SubItems[1].Text]).TextDefinition );
						if ( li.Text == "Triggers")
                            sb.Append( ((Triggers)db1.Triggers[li.SubItems[1].Text]).TextDefinition );
                        sb.Append( "\r\nGO\r\n" );
                    }
                    if ( li.SubItems[2].Text == "Missing in Database 2" )
                    {
                        if ( li.Text == "Function")
                            sb.Append( ((Function)db1.Functions[li.SubItems[1].Text]).TextDefinition );
                        if ( li.Text == "View")
                            sb.Append( ((Domain.View)db1.Views[li.SubItems[1].Text]).TextDefinition );
                        if ( li.Text == "StoredProc")
                            sb.Append( ((StoredProc)db1.StoredProcs[li.SubItems[1].Text]).TextDefinition );
						if ( li.Text == "Triggers")
							sb.Append( ((Triggers)db1.Triggers[li.SubItems[1].Text]).TextDefinition );
                        sb.Append( "\r\nGO\r\n" );
                    }
                }
            }
            ChangeScript cs = new ChangeScript();
            cs.SetText( sb.ToString() );
            cs.ShowDialog();
        }

        private string GetDropScript( string name, string type )
        {
            if ( type == "StoredProc" )
                type = "procedure";
            string s = @"
                    if ( exists( select 'x' from sysobjects where name='" + name + @"' ) )
                    begin drop " + type + @" " + name + " end";
            return s.Trim();
        }

        private void btnTest_Click(object sender, EventArgs e)
        {
            Test tst = new Test();            
            tst.Show();

        }

        private void lvDifferences_SelectedIndexChanged(object sender, EventArgs e)
        {            
            // proèitaj naziv objekta
            // i potom proèitaj fileke sa diska
            // i stavi ih u text boxove

            rtbSideAChange = true;
            rtbSideBChange = true;

            string strPrefix = "";
            string strInput = "";
            Boolean bolDisplay = false;
            lvSource.Items.Clear();
            lvDestination.Items.Clear();

            ListView.SelectedListViewItemCollection
                        selectedItems = lvDifferences.SelectedItems;

            if (selectedItems.Count > 0)
            {                
                if (selectedItems[0].Text == "StoredProc")
                {
                    strPrefix = "StoredProc ";
                }

                if (selectedItems[0].Text == "Function")
                {
                    strPrefix = "Function ";
                }

                if (selectedItems[0].Text == "Triggers")
                {
                    strPrefix = "Triggers ";
                }

                if (selectedItems[0].Text == "View")
                {
                    strPrefix = "View ";
                }

                if (selectedItems[0].Text == "Table")
                {
                    strPrefix = "Table ";
                }

                
                if ((selectedItems[0].SubItems[2].Text == "Different" && strPrefix != "") ||
                    (selectedItems[0].SubItems[2].Text == "Missing in Database 2" && strPrefix != "") ||
                    (selectedItems[0].SubItems[2].Text == "Missing in Database 1" && strPrefix != "")
                    )
                {                    
                    bolDisplay = true;

                    if (selectedItems[0].SubItems[2].Text != "Missing in Database 1")
                    {
                        // text A
                        rtbSideA.Text = "";                        
                        // orginalni text postoji u objektima
                        if (selectedItems[0].Text == "StoredProc")
                        {
                            rtbSideA.Text = ((StoredProc)db1.StoredProcs[selectedItems[0].SubItems[1].Text]).TextDefinition;
                        }

                        if (selectedItems[0].Text == "Function")
                        {
                            rtbSideA.Text = ((Function)db1.Functions[selectedItems[0].SubItems[1].Text]).TextDefinition;
                        }

                        if (selectedItems[0].Text == "Triggers")
                        {
                            rtbSideA.Text = ((Triggers)db1.Triggers[selectedItems[0].SubItems[1].Text]).TextDefinition;
                        }

                        if (selectedItems[0].Text == "View")
                        {
                            rtbSideA.Text = ((Domain.View)db1.Views[selectedItems[0].SubItems[1].Text]).TextDefinition;
                        }

                        if (selectedItems[0].Text == "Table")
                        {
                            rtbSideA.Text = ((Domain.UserTable)db1.UserTables[selectedItems[0].SubItems[1].Text]).ToString();
                        }
                    }
                    if (selectedItems[0].SubItems[2].Text != "Missing in Database 2")
                    {
                        // text B
                        rtbSideB.Text = "";
                        // orginalni text postoji u objektima
                        if (selectedItems[0].Text == "StoredProc")
                        {
                            rtbSideB.Text = ((StoredProc)db2.StoredProcs[selectedItems[0].SubItems[1].Text]).TextDefinition;
                        }

                        if (selectedItems[0].Text == "Function")
                        {
                            rtbSideB.Text = ((Function)db2.Functions[selectedItems[0].SubItems[1].Text]).TextDefinition;
                        }

                        if (selectedItems[0].Text == "Triggers")
                        {
                            rtbSideB.Text = ((Triggers)db2.Triggers[selectedItems[0].SubItems[1].Text]).TextDefinition;
                        }

                        if (selectedItems[0].Text == "View")
                        {
                            rtbSideB.Text = ((Domain.View)db2.Views[selectedItems[0].SubItems[1].Text]).TextDefinition;
                        }

                        if (selectedItems[0].Text == "Table")
                        {
                            rtbSideB.Text = ((Domain.UserTable)db2.UserTables[selectedItems[0].SubItems[1].Text]).ToString();
                        }
                    }
                }                
            }
            
            // no texts for display
            if (bolDisplay == false)
            {
                rtbSideA.Text = "";
                rtbSideB.Text = "";
            }

        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            this.Text = "DataBase Compare v" + Application.ProductVersion.ToString();
        }

        private void rtbSideA_TextChanged(object sender, EventArgs e)
        {
            // ovdje bi trebala iæi farbalica
            //inputLanguage = rtbSideA.Text;            
            //rtbSideA.Clear();
            //Regex r = new Regex("\\n");
            //String[] lines = r.Split(inputLanguage);
            //foreach (string l in lines)
            //{
            //    ParseLine(l,rtbSideA);
            //} 

            // farbalica 1
            if (rtbSideAChange == false)
                return;
            Int32 intPosition;
            intPosition = rtbSideA.SelectionStart;
            ParseALL(rtbSideA.Text, rtbSideA);
            rtbSideA.SelectionStart = intPosition;
            rtbSideA.SelectionLength = 0;
            rtbSideAChange = false;
        }

        private void rtbSideB_TextChanged(object sender, EventArgs e)
        {
            // ovdje bi trebala iæi farbalica
            //inputLanguage = rtbSideB.Text;            
            //rtbSideB.Clear();            
            //Regex r = new Regex("\\n");
            //String[] lines = r.Split(inputLanguage);
            //foreach (string l in lines)
            //{
            //    ParseLine(l, rtbSideB);
            //}            

            // farbalica 2
            if (rtbSideBChange == false)
                return;
            Int32 intPosition;
            intPosition = rtbSideB.SelectionStart;
            ParseALL(rtbSideB.Text, rtbSideB);
            rtbSideB.SelectionStart = intPosition;
            rtbSideB.SelectionLength = 0;
            rtbSideBChange = false;
        } 


        void ParseLine(string line, RichTextBox rtb)
        {
            //Regex r = new Regex("([ \\t{}():;])");
            Regex r = new Regex("([ \\t{}():;\n])");
            String[] tokens = r.Split(line);
            foreach (string token in tokens)
            {
                rtb.SelectionColor = Color.Black;
                LoadSQLDef();

                for (int i = 0; i < arrKey.Count; i++)
                {
                    if (arrKey[i].ToString().ToUpper() == token.ToUpper())
                    {
                        rtb.SelectionColor = Color.Blue;
                    }
                }

                for (int i = 0; i < arrComp.Count; i++)
                {
                    if (arrComp[i].ToString().ToUpper() == token.ToUpper())
                    {
                        rtb.SelectionColor = Color.Green;
                    }
                }

                for (int i = 0; i < arrOper.Count; i++)
                {
                    if (arrOper[i].ToString().ToUpper() == token.ToUpper())
                    {
                        rtb.SelectionColor = Color.Gray;
                    }
                }

                rtb.SelectedText = token;
            }
            rtb.SelectedText = "\n";
        }

        void ParseLineDiff(string strText, RichTextBox rtb,Color colColor)
        {
            rtb.SelectionBackColor = colColor;            
            strText = strText.Trim();
            if ( strText.Length < 1 )
                rtb.SelectedText = ("                                                        " 
                    + strText);
            else
                rtb.SelectedText = strText;
            
            rtb.SelectedText = "\n";

        }

        void LoadSQLDef()
        {
            try
            {
                if (xmlDoc == null)                
                {
                    xmlDoc = new XmlDocument();
                    xmlDoc.Load("SQLReservedWords.xml");

                    XmlNodeList xNodes = xmlDoc.SelectNodes("SQLReservedWords/*");

                    foreach (XmlNode nodeFromList in xNodes)
                    {
                        //Console.WriteLine(nodeFromList.Name);
                        //Console.WriteLine(nodeFromList.Attributes[0].Name);
                        //Console.WriteLine(nodeFromList.Attributes[0].Value);

                        if (nodeFromList.Attributes[0].Value == "keyword")
                        {
                            arrKey.Add(nodeFromList.Name);
                        }

                        if (nodeFromList.Attributes[0].Value == "compare")
                        {
                            arrComp.Add(nodeFromList.Name);
                        }

                        if (nodeFromList.Attributes[0].Value == "operator")
                        {
                            arrOper.Add(nodeFromList.Name);
                        }
                    }                 
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("pogreška " + ex.Message);
            }
            
        }

        private void btnDiff_Click(object sender, EventArgs e)
        {
            // if exists some text on both side then comapare

            //richTextBox1.Text = rtbSideA.Text;
            if (rtbSideA.Text.Length > 0 && rtbSideB.Text.Length > 0)
            {
                //TextDiff td = new TextDiff(rtbSideA.Text, rtbSideB.Text);
                //foreach (Diff.Hunk dh in td)
                //{
                //    rtbDifferences.Text += dh.ToString();                    
                //}
                try
                {
                    _level = DiffEngineLevel.SlowPerfect;
                    rtbSideA.SaveFile("src.rtf",RichTextBoxStreamType.PlainText);
                    rtbSideB.SaveFile("des.rtf", RichTextBoxStreamType.PlainText);
                    string sFile = Application.StartupPath + "\\src.rtf";
                    string dFile = Application.StartupPath + "\\des.rtf";
                    TextDiff(sFile, dFile);


                }
                catch (Exception ex)
                {
                    MessageBox.Show("error " + ex.Message.ToString());
                }
            }
        }

        private void TextDiff(string sFile, string dFile)
        {
            this.Cursor = Cursors.WaitCursor;

            DiffList_TextFile sLF = null;
            DiffList_TextFile dLF = null;
            try
            {
                //sFile = sFile.Replace("//", @"/");
                //dFile = dFile.Replace("//", @"/");
                sLF = new DiffList_TextFile(sFile);
                dLF = new DiffList_TextFile(dFile);
            }
            catch (Exception ex)
            {
                this.Cursor = Cursors.Default;
                MessageBox.Show(ex.Message, "File Error");
                return;
            }

            try
            {
                double time = 0;
                DiffEngine de = new DiffEngine();
                time = de.ProcessDiff(sLF, dLF, _level);

                ArrayList rep = de.DiffReport();
                //****************
                rtbSideA.LoadFile("src.rtf",RichTextBoxStreamType.PlainText);
                rtbSideB.LoadFile("des.rtf", RichTextBoxStreamType.PlainText);

                Results(sLF, dLF, rep, time);

                //Results dlg = new Results(sLF, dLF, rep, time);
                //dlg.ShowDialog();
                //dlg.Dispose();
            }
            catch (Exception ex)
            {
                this.Cursor = Cursors.Default;
                string tmp = string.Format("{0}{1}{1}***STACK***{1}{2}",
                    ex.Message,
                    Environment.NewLine,
                    ex.StackTrace);
                MessageBox.Show(tmp, "Compare Error");
                return;
            }
            this.Cursor = Cursors.Default;
        }


        public void Results(DiffList_TextFile source, DiffList_TextFile destination, ArrayList DiffLines, double seconds)
		{
			//InitializeComponent();
			//this.Text = string.Format("Results: {0} secs.",seconds.ToString("#0.00"));

			ListViewItem lviS;
			ListViewItem lviD;
            lvSource.Items.Clear();
            lvDestination.Items.Clear();            

			int cnt = 1;
			int i;

			foreach (DiffResultSpan drs in DiffLines)
			{				
				switch (drs.Status)
				{
					case DiffResultSpanStatus.DeleteSource:
						for (i = 0; i < drs.Length; i++)
						{
							lviS = new ListViewItem(cnt.ToString("00000"));
							lviD = new ListViewItem(cnt.ToString("00000"));
							lviS.BackColor = Color.Red;
							lviS.SubItems.Add(((TextLine)source.GetByIndex(drs.SourceIndex + i)).Line);
							lviD.BackColor = Color.LightGray;
							lviD.SubItems.Add("");

							lvSource.Items.Add(lviS);
							lvDestination.Items.Add(lviD);
                            //ParseLineDiff(lviS.SubItems[1].Text , rtbDiffSideA, lviS.BackColor);
                            //ParseLineDiff(lviD.SubItems[1].Text , rtbDiffSideB, lviD.BackColor);
							cnt++;
						}
						
						break;
					case DiffResultSpanStatus.NoChange:
						for (i = 0; i < drs.Length; i++)
						{
							lviS = new ListViewItem(cnt.ToString("00000"));
							lviD = new ListViewItem(cnt.ToString("00000"));
							lviS.BackColor = Color.White;
							lviS.SubItems.Add(((TextLine)source.GetByIndex(drs.SourceIndex+i)).Line);
							lviD.BackColor = Color.White;
							lviD.SubItems.Add(((TextLine)destination.GetByIndex(drs.DestIndex+i)).Line);

							lvSource.Items.Add(lviS);
							lvDestination.Items.Add(lviD);
                            //ParseLineDiff(lviS.SubItems[1].Text, rtbDiffSideA, lviS.BackColor);
                            //ParseLineDiff(lviD.SubItems[1].Text, rtbDiffSideB, lviD.BackColor);
							cnt++;
						}
						
						break;
					case DiffResultSpanStatus.AddDestination:
						for (i = 0; i < drs.Length; i++)
						{
							lviS = new ListViewItem(cnt.ToString("00000"));
							lviD = new ListViewItem(cnt.ToString("00000"));
							lviS.BackColor = Color.LightGray;
							lviS.SubItems.Add("");
							lviD.BackColor = Color.LightGreen;
							lviD.SubItems.Add(((TextLine)destination.GetByIndex(drs.DestIndex+i)).Line);

							lvSource.Items.Add(lviS);
							lvDestination.Items.Add(lviD);
                            //ParseLineDiff(lviS.SubItems[1].Text, rtbDiffSideA, lviS.BackColor);
                            //ParseLineDiff(lviD.SubItems[1].Text, rtbDiffSideB, lviD.BackColor);
							cnt++;
						}
						
						break;
					case DiffResultSpanStatus.Replace:
						for (i = 0; i < drs.Length; i++)
						{
							lviS = new ListViewItem(cnt.ToString("00000"));
							lviD = new ListViewItem(cnt.ToString("00000"));
							lviS.BackColor = Color.Red;
							lviS.SubItems.Add(((TextLine)source.GetByIndex(drs.SourceIndex+i)).Line);
							lviD.BackColor = Color.LightGreen;
							lviD.SubItems.Add(((TextLine)destination.GetByIndex(drs.DestIndex+i)).Line);                            
                            
                            lvSource.Items.Add(lviS);
							lvDestination.Items.Add(lviD);
                            //ParseLineDiff(lviS.SubItems[1].Text, rtbDiffSideA, lviS.BackColor);
                            //ParseLineDiff(lviD.SubItems[1].Text, rtbDiffSideB, lviD.BackColor);
							cnt++;
						}
						
						break;
				}				
			}
		}

        private void rtbSideA_VScroll(object sender, EventArgs e)
        {

            if (boMouseOverSideA)
            {
                Int32 RTB2Position;

                RTB2Position = GetScrollPos(rtbSideA.Handle, SBS_VERT);
                PostMessage(rtbSideB.Handle, WM_VSCROLL, SB_THUMBPOSITION + 0x10000 * RTB2Position, 0);
            }
        }

        private void rtbSideB_VScroll(object sender, EventArgs e)
        {
            if (boMouseOverSideB)
            {
                Int32 RTB1Position;

                RTB1Position = GetScrollPos(rtbSideB.Handle, SBS_VERT);
                PostMessage(rtbSideA.Handle, WM_VSCROLL, SB_THUMBPOSITION + 0x10000 * RTB1Position, 0);
            }
        }

        private void rtbSideA_MouseHover(object sender, EventArgs e)
        {
            boMouseOverSideA = true;
        }

        private void rtbSideA_MouseLeave(object sender, EventArgs e)
        {
            boMouseOverSideA = false;
        }
        
        private void rtbSideB_MouseHover(object sender, EventArgs e)
        {
            boMouseOverSideB = true;
        }

        private void rtbSideB_MouseLeave(object sender, EventArgs e)
        {
            boMouseOverSideB = false;
        }

        private void lvSource_MouseHover(object sender, EventArgs e)
        {
            boMouseOverDiffA = true;
        }

        private void lvSource_MouseLeave(object sender, EventArgs e)
        {
            boMouseOverDiffA = false;
        }

        private void lvSource_SelectedIndexChanged(object sender, EventArgs e)
        {
            //////if (boMouseOverDiffA)
            //////{
            //////    Int32 RTB1Position;

            //////    RTB1Position = GetScrollPos(lvSource.Handle, SBS_VERT);
            //////    PostMessage(lvDestination.Handle, WM_VSCROLL, SB_THUMBPOSITION + 0x10000 * RTB1Position, 0);
            //////}
        }

        void ParseALL(string sALL, RichTextBox rtb)
        {
            
            Regex regexObj;
            MatchCollection matoColl;
            LoadSQLDef();
            for (int i = 0; i < arrKey.Count; i++)
            {
                regexObj = new Regex(@"\b" +arrKey[i].ToString() + @"\b", 
                        RegexOptions.IgnoreCase | RegexOptions.IgnorePatternWhitespace | RegexOptions.Multiline);
                
                matoColl = regexObj.Matches(sALL);

                foreach (Match maca in matoColl)
                {
                    rtb.SelectionStart = maca.Index;
                    rtb.SelectionLength = maca.Length;
                    rtb.SelectionColor = rtb.SelectionColor = Color.Blue;                    
                }
            }
            
            for (int i = 0; i < arrComp.Count; i++)
            {
                regexObj = new Regex(@"\b" + arrComp[i].ToString() + @"\b",
                        RegexOptions.IgnoreCase | RegexOptions.IgnorePatternWhitespace | RegexOptions.Multiline);

                matoColl = regexObj.Matches(sALL);

                foreach (Match maca in matoColl)
                {
                    rtb.SelectionStart = maca.Index;
                    rtb.SelectionLength = maca.Length;
                    //rtb.SelectionColor = rtb.SelectionColor = Color.Green;
                    rtb.SelectionColor = rtb.SelectionColor = Color.Purple;
                }
            }

            for (int i = 0; i < arrOper.Count; i++)
            {
                regexObj = new Regex(@"\b" + arrOper[i].ToString() + @"\b",
                        RegexOptions.IgnoreCase | RegexOptions.IgnorePatternWhitespace | RegexOptions.Multiline);

                matoColl = regexObj.Matches(sALL);

                foreach (Match maca in matoColl)
                {
                    rtb.SelectionStart = maca.Index;
                    rtb.SelectionLength = maca.Length;
                    rtb.SelectionColor = rtb.SelectionColor = Color.Gray;
                }
            }

            // jedno redni comment
            regexObj = new Regex("--.*$",
                RegexOptions.IgnoreCase | RegexOptions.Multiline | RegexOptions.IgnorePatternWhitespace);
            
            matoColl = regexObj.Matches(sALL);

            foreach (Match maca in matoColl)
            {
                rtb.SelectionStart = maca.Index;
                rtb.SelectionLength = maca.Length;
                rtb.SelectionColor = rtb.SelectionColor = Color.Green;
            }

            // blok comment može biti u više redova
            regexObj = new Regex(@"/\*.*?\*/", 
                RegexOptions.Singleline | RegexOptions.IgnoreCase | RegexOptions.Multiline | RegexOptions.IgnorePatternWhitespace);

            matoColl = regexObj.Matches(sALL);

            foreach (Match maca in matoColl)
            {
                rtb.SelectionStart = maca.Index;
                rtb.SelectionLength = maca.Length;
                rtb.SelectionColor = rtb.SelectionColor = Color.Green;
            }

            // za tekst u navodnicima --- crvene boje
            regexObj = new Regex(@"(?:\').*?(?:\')", 
                   RegexOptions.Singleline | RegexOptions.IgnoreCase | RegexOptions.Multiline | RegexOptions.IgnorePatternWhitespace);

            matoColl = regexObj.Matches(sALL);

            foreach (Match maca in matoColl)
            {
                rtb.SelectionStart = maca.Index;
                rtb.SelectionLength = maca.Length;
                rtb.SelectionColor = rtb.SelectionColor = Color.Red;
            }

            rtb.SelectionStart = 0;

        }

        private void rtbSideB_DoubleClick(object sender, EventArgs e)
        {
            if (rtbSideB.Dock == DockStyle.None)
            {
                rtbSideB.Dock = DockStyle.Fill;
                rtbSideB.BringToFront();
            }
            else
            {
                rtbSideB.Dock = DockStyle.None;
                rtbSideB.SendToBack();
            }
        }

        private void rtbSideA_DoubleClick(object sender, EventArgs e)
        {
            if (rtbSideA.Dock == DockStyle.None)
            {
                rtbSideA.Dock = DockStyle.Fill;
                rtbSideA.BringToFront();
            }
            else
            {
                rtbSideA.Dock = DockStyle.None;
                rtbSideA.SendToBack();
            }
        }

        private void lvSource_DoubleClick(object sender, EventArgs e)
        {
            if (lvSource.Dock == DockStyle.None)
            {
                lvSource.Dock = DockStyle.Fill;
                lvSource.BringToFront();
            }
            else
            {
                lvSource.Dock = DockStyle.None;
                lvSource.SendToBack();
            }
        }

        private void lvDestination_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (lvDestination.Dock == DockStyle.None)
            {                
                lvDestination.Dock = DockStyle.Fill;
                lvDestination.BringToFront();
            }
            else
            {                
                lvDestination.Dock = DockStyle.None;
                lvDestination.SendToBack();
            }          

        }

        private void AllClear()
        {
            lvSource.Items.Clear();
            lvDestination.Items.Clear();
            rtbSideA.Clear();
            rtbSideB.Clear();
            lblNoFuntion.Visible = false;
            lblNoStore.Visible = false;
            lblNoTable.Visible = false;
            lblNoTrigger.Visible = false;
            lblNoView.Visible = false;

            intCountStore = 0;
            intCountFunction = 0;
            intCountTable = 0;
            intCountTrigger=0;
            intCountView = 0;
        }

        private void rtbSideB_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Space || e.KeyCode == Keys.Enter)
            {
                rtbSideBChange = true;
                rtbSideB_TextChanged(sender, e);
            }
            else
                rtbSideBChange = false;
        }

        private void rtbSideA_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Space || e.KeyCode == Keys.Enter)
            {
                rtbSideAChange = true;
                rtbSideA_TextChanged(sender, e);
            }
            else
                rtbSideAChange = false;
        }




    }
}
