   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:JewelleryStoreJewelleryStore  5   	       JewelleryStore.UserDialog   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   (localclr-namespace:JewelleryStore  5   	   _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  64     � Title$  Registration��5	   	   $	��375��6   $	��742��6+    � 
ResizeMode$ NoResize=�5
   	    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	    � 	Resources 5      (   "JewelleryStore.VisibilityConverter   BTVConverter��%   &	          5   
   6$   5      .��5      ��   PrimaryHueLightBrush#���  6   $��2q�6B   ._�5   
   � $��0,0,8,0q�6   $	��349��6    $	��Top=�6-    � RowDefinitions 5      �� 5      $	��48* �6    �� 5      $	��48* �6    �� 5      $	��48* �6    �� 5      $	��48* �6    �� 5      $	��48* �6    �� 5      $	��48* �6    �� 5      $	��48* �6    .+�5       �� -   5         ��Name$ 	userLabel��5         Register#��[ 6'   $��15(�6K   $��10,0,-0.2,51.8q�6Y   $
��Bold"�6q   #���  6�   $��2��6�   �� 5"      -   5         ��Name$ 	nameField��5"      $��1��6)   $	��350��66   $��40��6B    % !MaterialDesignFloatingHintTextBox#��[ 5$      )  #MaterialDesignThemes.Wpf.HintAssist   Hint# � ��5%      $
��Left=�5&      $��Center=�6-   $��20,0,0,0q�6H   ��5#      �� *Name+	 �� Mode$	 TwoWay=�
 �� UpdateSourceTrigger$
 PropertyChanged=�5&   H   �� 5(      -   5        $ lastnameField��5(      $��2��6-   $	��350��6:   $��40��6F   #��[ 5*        Lastname# �  5+      $
��Left=�5,      $��Center=�6/   $��20,0,0,0q�6J   ��5)      �� *
LastName+$	 TwoWay=�$
 PropertyChanged=�5,   J   �� 5.      -   5        $ usernameField��5.      $��1��6-   $	��350��6:   $��40��6F   #��[ 50        Username# �  51      $
��Left=�52      $��Center=�6/   $��	380,0,0,0q�6J   ��5/      �� *Login+$	 TwoWay=�$
 PropertyChanged=�52   J   G� 54      -   5         G�Name$ passwordBox��54      $��2��60   $	��350��6=   $��40��6J    ) %MaterialDesignFloatingHintPasswordBox#��[ 55        Password# �  56      $
��Left=�57      $��Center=�6/   $��	380,0,0,0q�6J   *  $Microsoft.Xaml.Behaviors.Interaction   	Behaviors 58      %   JewelleryStore.PasswordBehavior  59         Password 6-   �� *	Password1+$	 TwoWay=�$
 PropertyChanged=�5;      G� 5=      -   5        $ passwordBox_Repeat��5=      $��3��67   $	��350��6D   $��40��6Q   #��[ 5>        RepeatPassword# �  5?      $
��Left=�5@      $��Center=�6,   $��	380,0,0,0q�6G    5A        5B       6-   �� *	Password2+$	 TwoWay=�$
 PropertyChanged=�5D      �� 5E      -   5        $ 
emailField��5E      $��3��6+   $	��350��68   $��40��5F      #��[ 5G       
	 E-mail# � 	 5H      $
��Left=�5I      $��Center=�6/   $��20,0,0,0q�6J   ��5F   !   �� *Email+$	 TwoWay=�$
 PropertyChanged=�5I   J   (  "System.Windows.Controls.DatePicker  5J      -   5          Name$ dateOfBirth��5J       
 	DateBirth# � 
 5K       $  MaterialDesignOutlinedDatePicker#��[ 5L      $��20,24,360,0q�6I   $��4��6^   $��56��6k   $��2��6w   $	��Top=�6�      SelectedDate 5J   .   �� *DateOfBirth+5L   �   �� 5N      -	   5         ��Name$ AddBtn��5N       % !MaterialDesignOutlinedLightButton#��[ 5O      #���  5P      $��	91,4,91,4q�60   $��6��6C   $��40��6P   ��5N   %   �� *AddUserCommand+5P   P   �� 5S       ! MaterialDesignFlatLightButton#��[ 5T      $��
681,3,0,13q�5U      $
��Auto��6   ��5S      �� *CloseCommand+.��5V      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Close=�6*   5W      �� 5X      $
��Left=�6   $��4��63   $��14(�6@   $��WrapWithOverflow=�6N     PasswordRules#���  6n   
������� �� TextAlignment$ Center=�6�   $	��Top=�6�   $��44��6�   $	��350��6�   $��
380,30,0,0q�6�   $��2��6  �� 5Y        	ErrorName#���  6   
���  ��$
��Left=�6�   $��10(�6�   $��	15,44,0,0q�6�   $��1��6�   $	��Top=�6�   $	��350��6   $��20��6  $��2��6  y�6:   �� *ErrorNameVisibility+ �� 	Converter# [  6  �� 5Z        ErrorLastName#���  6   
���  ��$
��Left=�6�   $��10(�6�   $��	16,44,0,0q�6�   $��2��6�   $	��Top=�6�   $	��350��6  $��20��6  $��2��6   y�6>   �� *ErrorLastNameVisibility+# [  6   �� 5[      
���  ��$
��Left=�6E   $��10(�6`   $��
375,44,0,0q�6n   $��1��6�   $	��Top=�6�   $	��355��6�   $��20��6�   $��2��6�   ��6   �� *
ErrorLogin+6�   �� 5\      
���  ��$
��Left=�6H   $��10(�6c   $��
375,44,0,0q�6q   $��2��6�   $	��Top=�6�   $	��357��6�   $��20��6�   $��2��6�   ��6   �� *ErrorPassword+6�   �� 5]      
���  ��$
��Left=�6E   $��10(�6`   $��	15,44,0,0q�6n   $��3��6�   $	��Top=�6�   $	��350��6�   $��20��6�   $��2��6�   ��6   �� *
ErrorEmail+6�   5^      5_      5`      