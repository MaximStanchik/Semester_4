using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Calculator
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox2.Text = "";
            textBox1.Text = "";

            radioButton1.Checked = false;
            radioButton2.Checked = false;
            radioButton3.Checked = false;
            radioButton4.Checked = false;
            radioButton5.Checked = false;
            radioButton6.Checked = false;
            radioButton7.Checked = false;
            radioButton8.Checked = false;
            radioButton9.Checked = false;
            radioButton10.Checked = false;

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string userValue = textBox1.Text;
            try
            {
                double userValueDouble = Convert.ToDouble(userValue);

                if (radioButton1.Checked)
                {
                    userValueDouble = Math.Sin(userValueDouble);
                }
                if (radioButton2.Checked)
                {
                    userValueDouble = Math.Cos(userValueDouble);
                }
                if (radioButton3.Checked)
                {
                    userValueDouble = Math.Tan(userValueDouble);
                }
                if (radioButton4.Checked)
                {
                    userValueDouble = 1 / Math.Tan(userValueDouble);
                }

                if (radioButton7.Checked)
                {
                    userValueDouble = userValueDouble * 0.3;
                }
                if (radioButton6.Checked)
                {
                    userValueDouble = userValueDouble * 0.5;
                }
                if (radioButton5.Checked)
                {
                    userValueDouble = userValueDouble * 0.7;
                }

                int userValueInt = (int)userValueDouble;
                if (radioButton10.Checked)
                {
                    userValue = Convert.ToString(userValueInt, 2);
                }
                if (radioButton9.Checked)
                {
                    userValue = Convert.ToString(userValueInt, 8);
                }
                if (radioButton8.Checked)
                {
                    userValue = Convert.ToString(userValueInt, 16);
                }
                if (!radioButton10.Checked && !radioButton9.Checked && !radioButton8.Checked)
                {
                    userValue = Convert.ToString(userValueDouble);
                }
                    textBox2.Text = Convert.ToString(userValue);
            }
            catch {
                MessageBox.Show("Введите корректное значение ", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton7_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton5_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton6_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton10_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton9_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton8_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged_1(object sender, EventArgs e)
        {

        }
    }
}
