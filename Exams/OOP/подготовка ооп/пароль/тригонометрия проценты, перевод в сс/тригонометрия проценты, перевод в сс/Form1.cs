using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace тригонометрия_проценты__перевод_в_сс
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            double x = double.Parse(textBox1.Text);
            double res = 0;
            if (radioButton1.Checked == true)
            {
                res = Math.Sin(x);
                textBox2.Text = res.ToString();
                return;
            }
            else if (radioButton2.Checked == true)
            {
                res = Math.Cos(x);
                textBox2.Text = res.ToString();
                return;
            }
            else if (radioButton3.Checked == true)
            {
                res = Math.Tan(x);
                textBox2.Text = res.ToString();
                return;
            }
            else if (radioButton4.Checked == true)
            {
                res = 1/Math.Tan(x);
                textBox2.Text = res.ToString();
                return;
            }
            else if (radioButton5.Checked == true)
            {
                res = x * 0.3;
                textBox2.Text = res.ToString();
                return;
            }
            else if (radioButton6.Checked == true)
            {
                res = x * 0.5;
                textBox2.Text = res.ToString();
                return;
            }
            else if (radioButton7.Checked == true)
            {
                res = x * 0.7;
                textBox2.Text = res.ToString();
                return;
            }



           
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int xx = int.Parse(textBox3.Text);
            int sy = int.Parse(comboBox1.SelectedItem.ToString());
            textBox4.Text = Convert.ToString(xx, sy);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox1.Clear();
            textBox2.Clear();
            radioButton1.Checked = false;
            radioButton2.Checked = false;
            radioButton2.Checked = false;
            radioButton3.Checked = false;
            radioButton4.Checked = false;
            radioButton5.Checked = false;
            radioButton6.Checked = false;


        }
    }
}
