using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace StringSplitting
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
            string userValueString = textBox1.Text;
            if (!string.IsNullOrEmpty(userValueString))
            {
                int userValueStringLength = userValueString.Length;
                string userValueStringFirstHalf = userValueString.Substring(0, userValueStringLength/2);
                string userValueStringSecondHalf = userValueString.Substring(userValueStringLength/2);

                textBox1.Text = userValueStringFirstHalf;
                textBox2.Text = userValueStringSecondHalf;
            }
        }
    }
}
