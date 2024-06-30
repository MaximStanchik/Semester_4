using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DateTimePicker
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = "dd.MM.yyyy HH:mm:ss";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            dateTimePicker1.Value = dateTimePicker1.Value.AddDays(10);
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            DateTime userSelectedTime = dateTimePicker1.Value;
            if (userSelectedTime.Hour > 12)
            {
                label1.Text = "до полудня";
            }
            else if (userSelectedTime.Hour < 12)
            {
                label1.Text = "после полудня";
            }
            else
            {
                label1.Text = "Что-то непонятное...";
            }
        }
    }
}
