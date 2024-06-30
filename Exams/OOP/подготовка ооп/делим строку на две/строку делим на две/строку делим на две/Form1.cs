using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace строку_делим_на_две
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
           
          

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string a = textBox1.Text;
            if (!string.IsNullOrEmpty(a))
            {
                int half = a.Length / 2;
                string firsthalf = a.Substring(0, half);
                string pasthalf = a.Substring(half);

                textBox1.Text = firsthalf;
                label1.Text = pasthalf;
            }
        }
    }
}
