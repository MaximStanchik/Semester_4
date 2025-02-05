﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TwoCheckBoxesAndTimer
{
    public partial class Form1 : Form
    {
        private Timer timer;
        public Form1()
        {
            InitializeComponent();

            timer = new Timer();

            timer.Interval = 1000;
            timer.Tick += timer1_Tick;


            timer.Start();
        }

        int currentCheckbox = 1;
        private void timer1_Tick(object sender, EventArgs e)
        {
            switch (currentCheckbox)
            {
                case 1:
                    {
                        checkBox1.Checked = true;
                        checkBox2.Checked = false;
                        checkBox3.Checked = false;
                        break;
                    }
                case 2:
                    {
                        checkBox1.Checked = false;
                        checkBox2.Checked = true;
                        checkBox3.Checked = false;
                        break;
                    }
                case 3:
                    {
                        checkBox1.Checked = false;
                        checkBox2.Checked = false;
                        checkBox3.Checked = true;
                        break;
                    }
                default:
                    {
                        checkBox1.Checked = false;
                        checkBox2.Checked = false;
                        checkBox3.Checked = false;
                        break;
                    }
            }
            currentCheckbox++;
            if (currentCheckbox == 4)
            {
                currentCheckbox = 1;
            }
        }
    }
}
