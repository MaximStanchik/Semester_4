using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace казино_букв
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
          
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
         
            char a = char.Parse(textBox1.Text);
            if (a == genlet())
            {
                textBox2.Text = ("максвин");
            }
            else if(a > genlet())
            {
                textBox2.Text = ("загаданная буква меньше");
            }
            else if (a < genlet())
            {
                textBox2.Text = ("загаданная буква больше");
            }
        }


        public char genlet()
        {
            Random random = new Random();
            int num = random.Next(0, 26);
            char letter = (char)('A' + num);
            return letter;
        }

        private void button2_Click(object sender, EventArgs e)
        {
           genlet();
        }
    }
}
