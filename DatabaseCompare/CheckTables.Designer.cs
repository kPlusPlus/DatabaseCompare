namespace DatabaseCompare
{
    partial class CheckTables
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Configuration.AppSettingsReader configurationAppSettings = new System.Configuration.AppSettingsReader();
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
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.btnCheck = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
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
            this.groupBox1.Size = new System.Drawing.Size(208, 144);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Database 1 (ref. db)";
            // 
            // label5
            // 
            this.label5.Location = new System.Drawing.Point(8, 112);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(56, 16);
            this.label5.TabIndex = 9;
            this.label5.Text = "Password";
            // 
            // txtP1
            // 
            this.txtP1.Location = new System.Drawing.Point(96, 112);
            this.txtP1.Name = "txtP1";
            this.txtP1.Size = new System.Drawing.Size(100, 20);
            this.txtP1.TabIndex = 8;
            this.txtP1.Text = ((string)(configurationAppSettings.GetValue("txtP1.Text", typeof(string))));
            this.txtP1.UseSystemPasswordChar = true;
            // 
            // label4
            // 
            this.label4.Location = new System.Drawing.Point(8, 88);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(72, 16);
            this.label4.TabIndex = 7;
            this.label4.Text = "User Name";
            // 
            // txtUN1
            // 
            this.txtUN1.Location = new System.Drawing.Point(96, 88);
            this.txtUN1.Name = "txtUN1";
            this.txtUN1.Size = new System.Drawing.Size(100, 20);
            this.txtUN1.TabIndex = 6;
            this.txtUN1.Text = ((string)(configurationAppSettings.GetValue("txtUN1.Text", typeof(string))));
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(8, 68);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(80, 16);
            this.label3.TabIndex = 5;
            this.label3.Text = "Use Integrated";
            // 
            // chkSSPI1
            // 
            this.chkSSPI1.Checked = ((bool)(configurationAppSettings.GetValue("chkSSPI1.Checked", typeof(bool))));
            this.chkSSPI1.Location = new System.Drawing.Point(96, 64);
            this.chkSSPI1.Name = "chkSSPI1";
            this.chkSSPI1.Size = new System.Drawing.Size(104, 24);
            this.chkSSPI1.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(8, 40);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(56, 16);
            this.label2.TabIndex = 3;
            this.label2.Text = "Database";
            // 
            // txtDB1
            // 
            this.txtDB1.Location = new System.Drawing.Point(96, 40);
            this.txtDB1.Name = "txtDB1";
            this.txtDB1.Size = new System.Drawing.Size(100, 20);
            this.txtDB1.TabIndex = 2;
            this.txtDB1.Text = ((string)(configurationAppSettings.GetValue("txtDB1.Text", typeof(string))));
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(8, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 16);
            this.label1.TabIndex = 1;
            this.label1.Text = "Server";
            // 
            // txtServer1
            // 
            this.txtServer1.Location = new System.Drawing.Point(96, 16);
            this.txtServer1.Name = "txtServer1";
            this.txtServer1.Size = new System.Drawing.Size(100, 20);
            this.txtServer1.TabIndex = 0;
            this.txtServer1.Text = ((string)(configurationAppSettings.GetValue("txtServer1.Text", typeof(string))));
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(226, 12);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(446, 144);
            this.textBox1.TabIndex = 2;
            // 
            // btnCheck
            // 
            this.btnCheck.Location = new System.Drawing.Point(12, 162);
            this.btnCheck.Name = "btnCheck";
            this.btnCheck.Size = new System.Drawing.Size(208, 45);
            this.btnCheck.TabIndex = 3;
            this.btnCheck.Text = "Check tables";
            this.btnCheck.UseVisualStyleBackColor = true;
            this.btnCheck.Click += new System.EventHandler(this.btnCheck_Click);
            // 
            // CheckTables
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(684, 219);
            this.Controls.Add(this.btnCheck);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.groupBox1);
            this.Name = "CheckTables";
            this.Text = "CheckTables";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtP1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtUN1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.CheckBox chkSSPI1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtDB1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtServer1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button btnCheck;
    }
}