using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace бомба_таймер_
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        int tag = 1;
        private void timer1_Tick(object sender, EventArgs e)
        {
                if (tag == 1)
            {

                checkBox1.Checked = true;
                checkBox2.Checked = false;
                checkBox3.Checked = false;
            }
            if (tag == 2)
            {
                checkBox1.Checked = false;
                checkBox2.Checked = true;
                checkBox3.Checked = false;
            }
            if (tag == 3)
            {
                checkBox1.Checked = false;
                checkBox2.Checked = false;
                checkBox3.Checked = true;
            }
            tag++;
        }
    }
}
