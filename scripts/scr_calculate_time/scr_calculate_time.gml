
function scr_calculate_time(){
	//Display army time
	var hour = global.army_time;
	switch(global.time)
	{
		//0 HR
		case 0.00:
			global.army_time = "AM 12:00";
		break;
		//1 HR
		case 0.0336:
			global.army_time = "AM 01:00";
			global.night = true;//START OF THE WHOLE GAME
		break;
		//2 HR
		case 0.0714:
			global.army_time = "AM 02:00";
		break;
		//3 HR
		case 0.10919999999999996:
			global.army_time = "AM 03:00";
		break;
		//4 HR
		case 0.147:
			global.army_time = "AM 04:00";
		break;
		//5 HR
		case 0.18480000000000008:
			global.army_time = "AM 05:00";
		break;
		//6 HR
		case 0.22260000000000016:
			global.army_time = "AM 06:00";
		break;
		//7 HR
		case 0.2604000000000002:
			global.army_time = "AM 07:00";
			global.night = false;//END OF THE NIGHT
		break;
		//8 HR
		case 0.2982:
			global.army_time = "AM 08:00";
		break;
		//9 HR
		case 0.33599999999999985:
			global.army_time = "AM 09:00";
		break;
		//10 HR
		case 0.3737999999999997:
			global.army_time = "AM 10:00";
		break;
		//11 HR
		case 0.4115999999999995:
			global.army_time = "AM 11:00";
		break;
		//12 HR
		case 0.44939999999999936:
			global.army_time = "PM 12:00";
		break;
		//13 HR
		case 0.4871999999999992:
			global.army_time = "PM 1:00";
		break;
		//14 HR
		case 0.524999999999999:
			global.army_time = "PM 2:00";
		break;
		//15 HR
		case 0.5627999999999989:
			global.army_time = "PM 3:00";
		break;
		//16 HR
		case 0.6005999999999987:
			global.army_time = "PM 4:00";
		break;
		//17 HR
		case 0.6383999999999985:
			global.army_time = "PM 5:00";
		break;
		//18 HR
		case 0.6761999999999984:
			global.army_time = "PM 6:00";
		break;
		//19 HR
		case 0.7139999999999982:
			global.army_time = "PM 7:00";
		break;
		//20 HR
		case 0.751799999999998:
			global.army_time = "PM 8:00";
		break;
		//21 HR
		case 0.8105999999999978:
			global.army_time = "PM 9:00";
			global.night = true;//AFTER FIRST DAY THATS WHEN NIGHT STARTS
		break;
		//22 HR
		case 0.8819999999999975:
			global.army_time = "PM 10:00";
		break;
		//23 HR
		case 0.9407999999999972:
			global.army_time = "PM 11:00";
		break;
		default: global.army_time = hour;
	}
}