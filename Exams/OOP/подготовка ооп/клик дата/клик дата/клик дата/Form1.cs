using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace клик_дата
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBox1.Text = DateTime.Now.Year.ToString();   
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox2.Text = DateTime.Now.ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox3.Text = DateTime.Now.Minute.ToString();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            toolStripStatusLabel1.Text = DateTime.Now.ToString();
        }
    }
}
