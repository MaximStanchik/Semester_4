using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace разность_трекбаров
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int t1 = trackBar1.Value;
            int t2 = trackBar2.Value;
            int rez = t1 - t2;
            textBox1.Text = rez.ToString();
        }
    }
}
