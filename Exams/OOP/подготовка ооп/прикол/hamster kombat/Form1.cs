using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace hamster_kombat
{
    public partial class Form1 : Form
    {
        private int number = 0; 
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            number++; 
            label1.Text = number.ToString(); 
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
