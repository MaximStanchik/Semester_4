using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HeaderAndFooter
{
    public partial class Form1 : Form
    {
        private ToolStripStatusLabel toolStripStatusLabel1;

        public Form1()
        {
            InitializeComponent();
            InitializeStatusStrip();
        }

        private void InitializeStatusStrip()
        {
            statusStrip1 = new StatusStrip();
            toolStripStatusLabel1 = new ToolStripStatusLabel();

            statusStrip1.Items.Add(toolStripStatusLabel1);

            this.Controls.Add(statusStrip1);
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            if (System.Text.RegularExpressions.Regex.IsMatch(textBox1.Text, @"^\d+$"))
            {
                this.Text = "Форма " + textBox1.Text;
            }
            else
            {
                toolStripStatusLabel1.Text = textBox1.Text;
            }
        }
    }
}

