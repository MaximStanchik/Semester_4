using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Combobox
{
    public partial class Form1 : Form
    {
        private ToolStripStatusLabel toolStripStatusLabel1;
        public Form1()
        {
            InitializeComponent();
            initializeStatusStrip();
        }
        private void initializeStatusStrip ()
        {
            toolStripStatusLabel1 = new ToolStripStatusLabel();
            statusStrip1.Items.Add(toolStripStatusLabel1);
        }
        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string choosedEl = comboBox2.SelectedItem.ToString();
            toolStripStatusLabel1.Text = choosedEl;

        }
    }
}
