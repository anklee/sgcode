//
//  DeviceViewController.m
//  TabNav
//
//  Created by user on 11-8-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DeviceViewController.h"

@implementation DeviceViewController

@synthesize currentSession;
@synthesize request;
@synthesize guank;
@synthesize yuanbao;
@synthesize bt1;
@synthesize bt2;
@synthesize bt3;
@synthesize bt4;
@synthesize bt5;
@synthesize bt6;
@synthesize bt7;
@synthesize bt8;
@synthesize connect;
@synthesize disconnect;
@synthesize sendData;

GKPeerPickerController *picker;
NSString *filepath;
NSString *wxfilepath;
NSString *gameStatufilepath;
NSString *herofile;
AVAudioPlayer *audioplay;
NSString *  locationString;
NSString *dayHero;
NSString *dayUmeng;
UIImage *scImg;
NSString *sysDate;

- (void) viewDidLoad
{
    /*
     NSArray *familyNames = [UIFont familyNames];
     for( NSString *familyName in familyNames ){
     printf( "Family: %s \n", [familyName UTF8String] );
     NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
     for( NSString *fontName in fontNames ){
     printf( "\tFont: %s \n", [fontName UTF8String] );
     }
     }
     */
    
    
    
    Class cls = NSClassFromString(@"UMANUtil");
    SEL deviceIDSelector = @selector(openUDIDString);
    NSString *deviceID = nil;
    if(cls && [cls respondsToSelector:deviceIDSelector]){
        deviceID = [cls performSelector:deviceIDSelector];
    }
    NSLog(@"{\"oid\": \"%@\"}", deviceID);
    
    
    // 取友盟在线参数值
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onlineConfigCallBack:) name:UMOnlineConfigDidFinishedNotification object:nil];
    
    
    NSString *welecom =  [MobClick getConfigParams:@"welecom"];
    dayUmeng =  [MobClick getConfigParams:@"day"];
    NSString *dayCion = [MobClick getConfigParams:@"cion"];
    NSString *welcomCion = [NSString stringWithFormat:@"%@%@",welecom,dayCion];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"欢迎登录"
                                                    message:welcomCion
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
removeObserver:name:object:
    
    
    [connect setHidden:NO];
    [disconnect setHidden:YES];
    [sendData setHidden:YES];
    
    //系统日期
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMdd"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    dayHero = [NSString stringWithFormat:@"dayHero%@",locationString];
    sysDate = locationString;
    NSLog(@"locationString:%@",locationString);
    
    
    
    
    answerArry = [NSArray arrayWithObjects:
                  @"张飞",
                  @"关羽",
                  @"吕布",
                  @"马超",
                  @"袁绍",
                  @"夏侯渊",
                  @"夏侯惇",
                  @"华雄",
                  @"赵云",
                  @"颜良",
                  @"文丑",
                  @"许禇",
                  @"典韦",
                  @"张辽",
                  @"魏延",
                  @"严颜",
                  @"甘宁",
                  @"关平",
                  @"黄盖",
                  @"周仓",
                  @"太史慈",
                  @"黄忠",
                  @"曹仁",
                  @"张郃",
                  @"马岱",
                  @"庞德",
                  @"孟获",
                  @"吕蒙",
                  @"袁术",
                  @"袁熙",
                  @"袁尚",
                  @"袁谭",
                  @"刘备",
                  @"徐晃",
                  @"公孙瓒",
                  @"徐庶",
                  @"贾诩",
                  @"诸葛亮",
                  @"诸葛瑾",
                  @"曹洪",
                  @"曹植",
                  @"司马懿",
                  @"韩馥",
                  @"孔融",
                  @"曹操",
                  @"曹丕",
                  @"孙坚",
                  @"孙策",
                  @"孙权",
                  @"张鲁",
                  @"董卓",
                  @"刘璋",
                  @"刘禅",
                  @"刘表",
                  @"夏侯霸",
                  @"姜维",
                  @"蔡瑁",
                  @"司马昭",
                  @"周泰",
                  @"周瑜",
                  @"蒋琬",
                  @"钟会",
                  @"张昭",
                  @"陈宫",
                  @"程昱",
                  @"田丰",
                  @"马谡",
                  @"马良",
                  @"文聘",
                  @"法正",
                  @"庞统",
                  @"杨修",
                  @"陆逊",
                  @"廖化",
                  @"鲁肃",
                  @"邓艾",
                  @"阿哙喃",
                  @"金环三结",
                  @"兀突骨",
                  @"沙摩柯",
                  @"祝融",
                  @"带来洞主",
                  @"朵思大王",
                  @"董荼那",
                  @"忙牙长",
                  @"木鹿大王",
                  @"孟优",
                  @"纪灵",
                  @"荀攸",
                  @"程普",
                  @"糜竺",
                  @"糜芳",
                  @"满宠",
                  @"李典",
                  @"许攸",
                  @"丁奉",
                  @"庐植",
                  @"皇甫嵩",
                  @"司马炎",
                  @"杨仪",
                  @"吕笵",
                  @"管亥",
                  @"裴元绍",
                  @"满宠",
                  @"臧霸",
                  @"朱儁",
                  @"张邈",
                  @"谯周",
                  @"韩胤",
                  @"曹豹",
                  @"胡车儿",
                  @"蒋干",
                  @"何仪",
                  @"樊稠",
                  @"杨松",
                  @"华佗",
                  @"左慈",
                  @"张角",
                  @"张宝",
                  @"张梁",
                  @"程志远",
                  @"何进",
                  @"孙尚香",
                  @"灵帝",
                  @"少帝",
                  @"献帝",
                  @"貂蝉",
                  @"大乔",
                  @"小乔",
                  @"黄月英",
                  @"甄氏",
                  @"邹氏",
                  @"樊氏",
                  @"糜氏",
                  @"卞氏",
                  @"刘氏",
                  @"蔡氏",
                  @"孙氏",
                  nil];
    
    imageArry = [NSArray arrayWithObjects:
                 
                 @"00003_00002.png",
                 @"00003_00003.png",
                 @"00003_00004.png",
                 @"00003_00005.png",
                 @"00003_00006.png",
                 @"00003_00007.png",
                 @"00003_00008.png",
                 @"00003_00009.png",
                 @"00003_00010.png",
                 @"00003_00011.png",
                 @"00003_00012.png",
                 @"00003_00013.png",
                 @"00003_00014.png",
                 @"00003_00015.png",
                 @"00003_00016.png",
                 @"00003_00017.png",
                 @"00003_00018.png",
                 @"00003_00019.png",
                 @"00003_00020.png",
                 @"00003_00021.png",
                 @"00003_00023.png",
                 @"00003_00024.png",
                 @"00003_00025.png",
                 @"00003_00026.png",
                 @"00003_00027.png",
                 @"00003_00029.png",
                 @"00003_00030.png",
                 @"00003_00031.png",
                 @"00003_00033.png",
                 @"00003_00034.png",
                 @"00003_00035.png",
                 @"00003_00036.png",
                 @"00003_00037.png",
                 @"00003_00038.png",
                 @"00003_00039.png",
                 @"00003_00040.png",
                 @"00003_00043.png",
                 @"00003_00046.png",
                 @"00003_00047.png",
                 @"00003_00048.png",
                 @"00003_00049.png",
                 @"00003_00050.png",
                 @"00003_00054.png",
                 @"00003_00059.png",
                 @"00003_00061.png",
                 @"00003_00062.png",
                 @"00003_00063.png",
                 @"00003_00064.png",
                 @"00003_00065.png",
                 @"00003_00067.png",
                 @"00003_00069.png",
                 @"00003_00072.png",
                 @"00003_00073.png",
                 @"00003_00075.png",
                 @"00003_00081.png",
                 @"00003_00085.png",
                 @"00003_00088.png",
                 @"00003_00090.png",
                 @"00003_00091.png",
                 @"00003_00092.png",
                 @"00003_00093.png",
                 @"00003_00094.png",
                 @"00003_00103.png",
                 @"00003_00105.png",
                 @"00003_00107.png",
                 @"00003_00108.png",
                 @"00003_00109.png",
                 @"00003_00110.png",
                 @"00003_00112.png",
                 @"00003_00114.png",
                 @"00003_00115.png",
                 @"00003_00117.png",
                 @"00003_00118.png",
                 @"00003_00122.png",
                 @"00003_00124.png",
                 @"00003_00127.png",
                 @"00003_00128.png",
                 @"00003_00133.png",
                 @"00003_00135.png",
                 @"00003_00137.png",
                 @"00003_00138.png",
                 @"00003_00139.png",
                 @"00003_00140.png",
                 @"00003_00143.png",
                 @"00003_00145.png",
                 @"00003_00146.png",
                 @"00003_00148.png",
                 @"00003_00156.png",
                 @"00003_00158.png",
                 @"00003_00162.png",
                 @"00003_00163.png",
                 @"00003_00164.png",
                 @"00003_00167.png",
                 @"00003_00168.png",
                 @"00003_00178.png",
                 @"00003_00190.png",
                 @"00003_00201.png",
                 @"00003_00202.png",
                 @"00003_00210.png",
                 @"00003_00228.png",
                 @"00003_00234.png",
                 @"00003_00256.png",
                 @"00003_00259.png",
                 @"00003_00261.png",
                 @"00003_00262.png",
                 @"00003_00268.png",
                 @"00003_00270.png",
                 @"00003_00271.png",
                 @"00003_00281.png",
                 @"00003_00282.png",
                 @"00003_00293.png",
                 @"00003_00350.png",
                 @"00003_00415.png",
                 @"00003_00418.png",
                 @"00003_00442.png",
                 @"00003_00498.png",
                 @"00003_00501.png",
                 @"00003_00521.png",
                 @"00003_00522.png",
                 @"00003_00523.png",
                 @"00003_00524.png",
                 @"00003_00531.png",
                 @"00003_00539.png",
                 @"00003_00564.png",
                 @"00003_00565.png",
                 @"00003_00566.png",
                 @"00003_00567.png",
                 @"00003_00568.png",
                 @"00003_00569.png",
                 @"00003_00666.png",
                 @"00003_00733.png",
                 @"00003_00734.png",
                 @"00003_00735.png",
                 @"00003_00770.png",
                 @"00003_00774.png",
                 @"00003_00775.png",
                 @"00003_00776.png",
                 @"00003_00779.png",
                 nil];
    
    
    aswRequest = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"张飞",@"1",
                  @"关羽",@"2",
                  @"吕布",@"3",
                  @"马超",@"4",
                  @"袁绍",@"5",
                  @"夏侯渊",@"6",
                  @"夏侯惇",@"7",
                  @"华雄",@"8",
                  @"赵云",@"9",
                  @"颜良",@"10",
                  @"文丑",@"11",
                  @"许禇",@"12",
                  @"典韦",@"13",
                  @"张辽",@"14",
                  @"魏延",@"15",
                  @"严颜",@"16",
                  @"甘宁",@"17",
                  @"关平",@"18",
                  @"黄盖",@"19",
                  @"周仓",@"20",
                  @"太史慈",@"21",
                  @"黄忠",@"22",
                  @"曹仁",@"23",
                  @"张郃",@"24",
                  @"马岱",@"25",
                  @"庞德",@"26",
                  @"孟获",@"27",
                  @"吕蒙",@"28",
                  @"袁术",@"29",
                  @"袁熙",@"30",
                  @"袁尚",@"31",
                  @"袁谭",@"32",
                  @"刘备",@"33",
                  @"徐晃",@"34",
                  @"公孙瓒",@"35",
                  @"徐庶",@"36",
                  @"贾诩",@"37",
                  @"诸葛亮",@"38",
                  @"诸葛瑾",@"39",
                  @"曹洪",@"40",
                  @"曹植",@"41",
                  @"司马懿",@"42",
                  @"韩馥",@"43",
                  @"孔融",@"44",
                  @"曹操",@"45",
                  @"曹丕",@"46",
                  @"孙坚",@"47",
                  @"孙策",@"48",
                  @"孙权",@"49",
                  @"张鲁",@"50",
                  @"董卓",@"51",
                  @"刘璋",@"52",
                  @"刘禅",@"53",
                  @"刘表",@"54",
                  @"夏侯霸",@"55",
                  @"姜维",@"56",
                  @"蔡瑁",@"57",
                  @"司马昭",@"58",
                  @"周泰",@"59",
                  @"周瑜",@"60",
                  @"蒋琬",@"61",
                  @"钟会",@"62",
                  @"张昭",@"63",
                  @"陈宫",@"64",
                  @"程昱",@"65",
                  @"田丰",@"66",
                  @"马谡",@"67",
                  @"马良",@"68",
                  @"文聘",@"69",
                  @"法正",@"70",
                  @"庞统",@"71",
                  @"杨修",@"72",
                  @"陆逊",@"73",
                  @"廖化",@"74",
                  @"鲁肃",@"75",
                  @"邓艾",@"76",
                  @"阿哙喃",@"77",
                  @"金环三结",@"78",
                  @"兀突骨",@"79",
                  @"沙摩柯",@"80",
                  @"祝融",@"81",
                  @"带来洞主",@"82",
                  @"朵思大王",@"83",
                  @"董荼那",@"84",
                  @"忙牙长",@"85",
                  @"木鹿大王",@"86",
                  @"孟优",@"87",
                  @"纪灵",@"88",
                  @"荀攸",@"89",
                  @"程普",@"90",
                  @"糜竺",@"91",
                  @"糜芳",@"92",
                  @"满宠",@"93",
                  @"李典",@"94",
                  @"许攸",@"95",
                  @"丁奉",@"96",
                  @"庐植",@"97",
                  @"皇甫嵩",@"98",
                  @"司马炎",@"99",
                  @"杨仪",@"100",
                  @"吕笵",@"101",
                  @"管亥",@"102",
                  @"裴元绍",@"103",
                  @"满宠",@"104",
                  @"臧霸",@"105",
                  @"朱儁",@"106",
                  @"张邈",@"107",
                  @"谯周",@"108",
                  @"韩胤",@"109",
                  @"曹豹",@"110",
                  @"胡车儿",@"111",
                  @"蒋干",@"112",
                  @"何仪",@"113",
                  @"樊稠",@"114",
                  @"杨松",@"115",
                  @"华佗",@"116",
                  @"左慈",@"117",
                  @"张角",@"118",
                  @"张宝",@"119",
                  @"张梁",@"120",
                  @"程志远",@"121",
                  @"何进",@"122",
                  @"孙尚香",@"123",
                  @"灵帝",@"124",
                  @"少帝",@"125",
                  @"献帝",@"126",
                  @"貂蝉",@"127",
                  @"大乔",@"128",
                  @"小乔",@"129",
                  @"黄月英",@"130",
                  @"甄氏",@"131",
                  @"邹氏",@"132",
                  @"樊氏",@"133",
                  @"糜氏",@"134",
                  @"卞氏",@"135",
                  @"刘氏",@"136",
                  @"蔡氏",@"137",
                  @"孙氏",@"138",
                  nil];
    
    
    tishiArry = [NSArray arrayWithObjects:
                 @"张飞",
                 @"关羽",
                 @"吕布",
                 @"马超",
                 @"袁绍",
                 @"夏侯渊",
                 @"夏侯惇",
                 @"华雄",
                 @"赵云",
                 @"颜良",
                 @"文丑",
                 @"许禇",
                 @"典韦",
                 @"张辽",
                 @"魏延",
                 @"严颜",
                 @"甘宁",
                 @"关平",
                 @"黄盖",
                 @"周仓",
                 @"太史慈",
                 @"黄忠",
                 @"曹仁",
                 @"张郃",
                 @"马岱",
                 @"庞德",
                 @"孟获",
                 @"吕蒙",
                 @"袁术",
                 @"袁熙",
                 @"袁尚",
                 @"袁谭",
                 @"刘备",
                 @"徐晃",
                 @"公孙瓒",
                 @"徐庶",
                 @"贾诩",
                 @"诸葛亮",
                 @"诸葛瑾",
                 @"曹洪",
                 @"曹植",
                 @"司马懿",
                 @"韩馥",
                 @"孔融",
                 @"曹操",
                 @"曹丕",
                 @"孙坚",
                 @"孙策",
                 @"孙权",
                 @"张鲁",
                 @"董卓",
                 @"刘璋",
                 @"刘禅",
                 @"刘表",
                 @"夏侯霸",
                 @"姜维",
                 @"蔡瑁",
                 @"司马昭",
                 @"周泰",
                 @"周瑜",
                 @"蒋琬",
                 @"钟会",
                 @"张昭",
                 @"陈宫",
                 @"程昱",
                 @"田丰",
                 @"马谡",
                 @"马良",
                 @"文聘",
                 @"法正",
                 @"庞统",
                 @"杨修",
                 @"陆逊",
                 @"廖化",
                 @"鲁肃",
                 @"邓艾",
                 @"阿哙喃",
                 @"金环三结",
                 @"兀突骨",
                 @"沙摩柯",
                 @"祝融",
                 @"带来洞主",
                 @"朵思大王",
                 @"董荼那",
                 @"忙牙长",
                 @"木鹿大王",
                 @"孟优",
                 @"纪灵",
                 @"荀攸",
                 @"程普",
                 @"糜竺",
                 @"糜芳",
                 @"满宠",
                 @"李典",
                 @"许攸",
                 @"丁奉",
                 @"庐植",
                 @"皇甫嵩",
                 @"司马炎",
                 @"杨仪",
                 @"吕笵",
                 @"管亥",
                 @"裴元绍",
                 @"满宠",
                 @"臧霸",
                 @"朱儁",
                 @"张邈",
                 @"谯周",
                 @"韩胤",
                 @"曹豹",
                 @"胡车儿",
                 @"蒋干",
                 @"何仪",
                 @"樊稠",
                 @"杨松",
                 @"华佗",
                 @"左慈",
                 @"张角",
                 @"张宝",
                 @"张梁",
                 @"程志远",
                 @"何进",
                 @"孙尚香",
                 @"灵帝",
                 @"少帝",
                 @"献帝",
                 @"貂蝉",
                 @"大乔",
                 @"小乔",
                 @"黄月英",
                 @"甄氏",
                 @"邹氏",
                 @"樊氏",
                 @"糜氏",
                 @"卞氏",
                 @"刘氏",
                 @"蔡氏",
                 @"孙氏",
                 nil];
    
    requestArry = [NSArray arrayWithObjects:
                   @"长坂坡据水断桥|义释严颜|怒鞭督邮",
                   @"过五关斩六将|千里走单骑|败走麦城|义释曹操|温酒斩华雄",
                   @"独战三英|辕门射戟|三姓家奴",
                   @"蜀汉五虎上将|神威天将军",
                   @"四世三公，势盖群雄，鹰扬河朔，他人做嫁。",
                   @"太祖连襟，用兵奇疾，妙才无双，战死沙场。",
                   @"拨矢啖睛，独目苍狼，骁勇无双，大魏军魂。",
                   @"汜水关抵挡十八路诸侯联军",
                   @"单骑救阿斗|一身是胆",
                   @"袁绍部下武将|被关羽击杀",
                   @"勇冠三军",
                   @"飞石退敌，倒牛百步，赤膊上阵，质重少言。",
                   @"铁戟双提八十斤",
                   @"五子良将|阵斩蹋顿|威震江东",
                   @"知遇先主，独镇汉中，将相失和，悲剧英雄。",
                   @"巴郡太守",
                   @"破黄祖|退关羽|袭曹营",
                   @"关羽之子",
                   @"火攻赤壁|苦肉计",
                   @"樊城之战活捉庞德",
                   @"北海救孔融",
                   @"五虎上将|万夫不当之勇",
                   @"江陵战瑜",
                   @"韩信归汉，巧变善战，大战街亭，剑阁成仁。",
                   @"斩杀魏延",
                   @"白马将军|射关羽中额",
                   @"七擒七纵",
                   @"吴下阿蒙|击杀关羽",
                   @"与孙坚共破董卓，称雄淮南",
                   @"袁绍之子|幽州刺史|",
                   @"袁绍之子|袁绍继承人",
                   @"袁绍之子|车骑将军",
                   @"蜀汉开国皇帝",
                   @"良禽择木而栖，贤臣择主而事",
                   @"威震辽东，白马义从，文武相斗，困守易京。",
                   @"身在曹营心在汉",
                   @"奇谋百出，算无遗策",
                   @"空城计|草船借箭",
                   @"吴国大臣|诸葛亮之兄",
                   @"舍命献马救曹操",
                   @"洛神赋|本自同根生，相煎何太急",
                   @"中空城计",
                   @"冀州牧|讨伐董卓之一|自杀身亡",
                   @"让梨",
                   @"宁教我负天下人，休教天下人负我！",
                   @"曹魏开国皇帝",
                   @"东吴始祖武烈皇帝|讨伐董卓之一|破虏将军",
                   @"江东小霸王",
                   @"东吴皇帝",
                   @"五斗米道首领|投降曹操官拜镇南将军",
                   @"官至太师|吕布所杀",
                   @"益州牧|迎刘备入益州|引狼入室|刘璋军杀死军师庞统",
                   @"阿斗",
                   @"荆州牧|欲托荆州与刘备",
                   @"夏侯渊次子|蜀车骑将军",
                   @"字伯约|11次伐魏|",
                   @"赤壁之战蒋干中了周瑜的反间计被曹操误杀",
                   @"晋文帝|XXX之心，路人皆知也",
                   @"随孙策左右|孙权赐与御帻青缣盖|大战许褚",
                   @"赔了夫人又折兵",
                   @"蜀汉宰相",
                   @"斩首嵇康|与姜维欲据蜀自立",
                   @"赤壁前夕主张投降曹操|诸葛亮与东吴舌战群儒带头者|内事不决问**,外事不决问周瑜。",
                   @"因曹操多疑杀吕伯奢与之反目|，随吕布一同被曹操所擒，决意赴死。",
                   @"刘备投靠曹操时曾劝曹操杀掉刘备|关羽千里走单骑时建议曹操杀掉关羽",
                   @"官渡之战时谏阻袁绍征伐曹操。战败后，遭到逢纪谗言后被杀。",
                   @"刚愎自用|街亭失守|诸葛亮挥泪斩首",
                   @"“马氏五常，白眉最良”|招降五溪蛮夷",
                   @"刘表手下大将|江夏太守|防守荆州败关羽和孙权",
                   @"刘璋部下，后投归刘备|死后刘备追谥其为翼侯",
                   @"字士元，号凤雏",
                   @"丞相曹操的主簿|因参与夺嫡被杀|与曹操的政治观点不同，遭猜忌。",
                   @"孙策之女婿|在夷陵之战中，大败刘备。|火烧连营",
                   @"蜀汉老将|数次随姜维北伐",
                   @"字子敬|献孙权榻上策|力主联蜀合纵抗魏",
                   @"曹魏后期名将|建立灭蜀奇功，后被钟会诬陷被杀。",
                   @"南蛮王孟获部下|背叛孟获擒之送诸葛亮",
                   @"南蛮孟获属下大将，第一洞元帅|被赵云一枪刺死",
                   @"南蛮乌戈国之主",
                   @"五溪蛮夷首领|陆逊以火攻败死",
                   @"南蛮孟获之妻",
                   @"孟获之妻祝融夫人之弟",
                   @"南蛮秃龙洞的元帅",
                   @"南蛮王孟获属下大将|第二洞元帅",
                   @"南蛮王孟获的部将|被平北将军马岱斩杀",
                   @"八纳洞洞主，能使法术，呼风唤雨，操纵猛兽",
                   @"南蛮王孟获之弟",
                   @"率军攻打刘备|吕布“辕门射戟”撤兵",
                   @"字公达|密谋刺杀董卓而入狱|算无遗策|献奇计水淹下邳城，活捉吕布。",
                   @"东吴武将三代元勋",
                   @"安汉将军，待遇为蜀汉众臣中最高|其弟糜芳举城投降，导致关羽兵败身亡。",
                   @"被关羽责骂，心中不安，投降东吴，导致关羽兵败被杀。",
                   @"魏国名将|樊城坚守击败关羽",
                   @"深明大义，儒雅上将，典谋进猛，天妒英才。",
                   @"官渡献计，奇袭乌巢",
                   @"吴国四朝元老|解救寿春|诛杀孙綝",
                   @"刘备为之门下弟子",
                   @"与朱儁率军镇压黄巾起义|被董卓陷害下狱|平定“王国叛乱”",
                   @"晋朝开国皇帝",
                   @"诛杀魏延",
                   @"字子衡",
                   @"黄巾起义军将领|围攻孔融被刘备击退",
                   @"欲夺赵云之马，反遭讨伐战败身死。",
                   @"魏国名将|樊城坚守击败关羽",
                   @"居巢破孙权，逢龙败韩当",
                   @"与皇甫嵩等平定黄巾之乱",
                   @"董卓之乱时，为陈留太守，与袁绍等共同起兵讨董",
                   @"作《仇国论》，劝蜀姜维少兴兵|劝刘禅投降",
                   @"袁术之使|术欲结吕布为援，乃为子索布女。",
                   @"吕布丈人",
                   @"盗典韦双戟",
                   @"群英会中计",
                   @"黄巾将领|被许褚给活捉，献给曹操。",
                   @"败吕布、杀王允",
                   @"卖主求荣，操命斩之于市曹示众",
                   @"刮骨疗伤",
                   @"遁甲天书",
                   @"太平道人|天公将军",
                   @"地公将军",
                   @"人公将军",
                   @"黄巾军将领|被关羽一刀挥为两段",
                   @"召董卓带兵入京",
                   @"刘备之妻|赔了夫人又折兵",
                   @"东汉第十一位皇帝",
                   @"刘恭",
                   @"刘协",
                   @"中国古代四大美女之一",
                   @"孙策之妻",
                   @"周瑜之妻",
                   @"诸葛亮之妻",
                   @"魏文帝曹丕的正室",
                   @"？",
                   @"？",
                   @"？",
                   @"？",
                   @"？",
                   @"？",
                   @"？",
                   nil];
    
    /*
     tishiArry = [NSArray arrayWithObjects:
     @"关羽与东吴大将吕蒙在荆州交战，大败退守麦城。由于兵少粮尽，关羽不得不放弃麦城向西川撤退。关羽想走小路，部下担心有埋伏，可是关羽自恃勇力，不听劝告，果然遇到伏兵。寡不敌众，关羽父子遭擒被杀。",
     @"中平六年五月，瘟疫流行，张角散发符水于民间，治病救人”。张角的徒弟五百余人，云游四方，都能治病救人。张角立三十六方，各方又立首领，统称为将军。他们广为散布这样一句话：“苍天已死，黄天当立；岁在甲子，天下大吉。",
     @"诸葛亮舌战群儒说服吴国联蜀抗魏",
     @"曹操见徐晃英勇十分喜欢，说：“徐晃乃良将也，吾不忍心杀，想以计招之。差满宠招安徐晃，徐晃为人忠心仗义，满宠说：“良禽择木而栖，贤臣择主而事。遇到可事之主而不从，非丈夫也。”",
     @"曹操谋刺董卓未成，逃出京城，在中牟县被县令陈宫捉住。陈宫钦佩他的忠义，弃了官职与他同逃。逃到成皋，多疑的曹操错杀吕伯奢家人，又杀死好心的吕伯奢以绝后祸。陈宫看出曹操心狠手辣，但又念及自己为国家跟他到此，杀之不义，便弃曹操而他往。",
     @"“青梅煮酒论英雄”曹操用手一指刘备，再指自己，说：“今天下英雄，惟使君与操耳!”这一话语展现了他的踌躇满志与骄横霸气。刘备听了曹操的话吓得变了脸色，匙箸掉到地上，急忙借惊雷之声掩饰过去，体现了他小心谨慎、机智从容。",
     @"曹操行刺董卓被识破，假装献七星宝刀逃走。被县令陈宫抓获，对陈宫说出此话，陈宫被曹操的忠义感动随曹操弃官而逃。",
     @"袁绍率十八路诸侯讨伐董卓，董卓大将华雄连斩数将，各路诸侯大惊失色。关羽高声请缨，却因身份低微遭人嘲笑。但他立下军令状，胜不了华雄愿受斩。曹操端杯热酒为关羽壮行，关羽愿先去斩华雄，回来再喝酒。在温酒未凉之际提来了华雄首级，令众诸侯惊讶不已。",
     @"董卓派李儒送赤兔马给吕布，吕布反目杀死义父丁原投靠董卓。",
     @"血染征袍透甲红，当阳谁敢与争锋！古来冲阵扶危主，只有常山赵子龙。",
     @"曹操赤壁之战兵败，在华容道被关羽擒获，为报曹操的知遇之恩释放了曹操。曹瞒兵败走华容，正与关公狭路逢。只为当初恩义重，放开金锁走龙。",
     @"威镇乾坤第一功，辕门画鼓响冬冬。云长停盏施英勇，酒尚温时斩华雄。",
     @"由徐庶的推荐，刘备、关羽、张飞三次前往隆中拜访诸葛亮。第一次小僮说诸葛外出远游，只见到崔州平。第二次留下一封信冒雪回去，见到诸葛均、石广元、孟公威、黄承彦，第三次恰好诸葛亮在午睡，刘备一直等到他睡醒更衣后才得以相见。诸葛亮被刘备求贤若渴的诚心感动，最终答应出山共图大业。",
     @"董卓赠吕布赤兔马，吕布杀义父丁原献董卓",
     @"督邮向刘备索贿不成想害他，百姓求情被打。张飞绑督邮于马桩，用柳条猛抽。",
     @"为向蜀汉索回荆州，周瑜定美人计，引刘备入吴招亲，要挟刘备交还荆州。刘备按照诸葛亮的对策行事，到东吴成婚后偕同孙夫人逃出东吴。周瑜带兵追赶，却被诸葛亮的伏兵打败，使得东吴赔了夫人又折兵。",
     @"汉灵帝中平元年，河北巨鹿有兄弟三人：老大名叫张角，老二张宝，老三张梁。有一回，张角上山采药，遇见一位老人。这位老者，碧眼童颜，手拿拐杖，把张角唤入一个洞中，送给张角天书三卷。这书名叫《太平要术》。老人告诉张角：“这书名叫《太平要术》，你得此天书，是上天的旨意，一定要普救世人。假若萌发异心，必遭恶报。”张角拜问老人姓名，老人说：“吾乃南华老仙也。”说完，便化了一阵清风而去。",
     @"诸葛亮把部队都派去攻打魏军，只留少数老弱残兵在阳平城中。魏军大都督司马懿率大军来攻城。诸葛亮临危不惧，传令大开城门，还派人去城门口洒扫。他自己登上城楼，端坐弹琴，态度从容。司马懿见此情形，心生疑窦，怕有伏兵，下令退兵。",
     @"周瑜想杀死诸葛亮，以除后患，令其十天内造出十万支箭，诸葛亮却立军令状三天完成。他前二天按兵不动，暗中叫鲁肃备大船二十，各船扎草人千个。第三天四更，江上大雾迷漫，诸葛亮率船到曹军水寨前擂鼓呐喊佯攻，曹军怕中计，下令弓箭手向江中射箭。当船的一边被射满后，诸葛亮令调转船头，等到被箭射满后才离开。不费吹灰之力就完成了任务。一天浓雾满长江，远近难分水渺茫。骤雨飞蝗来战舰，孔明今日伏周郎。",
     @"过五关斩六将：关羽得知刘备的下落，当即将官印吊于屋中，并留下书信，带上嫂嫂，不辞而别，奔向刘备。路经东岭关、洛阳城、汜水关、荥阳城、黄河渡口，因为未得到曹操的文书，各关隘的守将皆不放行，关羽迫不得已斩了曹操的六员大将．连闯五道关口。封金挂印辞汉相，寻兄遥望远徐还。骑马赤兔行千里，刀偃青龙出五关。忠义慨然冲宇宙，英雄从此震江山。独行斩将应无敌，今古留名翰墨间。",
     @"关羽暂时“归降”曹操后，得知兄长刘备的消息后立即护送嫂嫂投奔刘备，不辞而别离开曹操；一路上过五关斩六将，最后跟刘备会合，充分展现了关羽的忠肝义胆，表现了对刘备“誓同生死”的忠义之情。",
     @"苏双、张世平赠刘备好马五十匹、金银五百两、好铁一千斤，以用来打造武器。刘备命打铁高匠造双股剑。关云长造青龙偃月刀一柄，又名“冷艳锯”，重八十二斤。张飞造丈八点钢矛一把。",
     @"司徒王允翘设连环计将貂蝉献给谁吕布，离间董卓和吕布，吕布好色反目杀董卓。",
     @"曹操进攻刘备，刘备撤退。张飞在长坂桥断后。他巧设疑兵，叫随从在马尾上拴带树枝，往来奔跑，冲起尘雾，使曹军莫知虚实。他怒目横矛，立马桥上，他大吼三声，吓得夏侯杰肝胆破裂而亡，曹操及诸军众仓皇而逃。见曹军已退，张飞便令拆断桥梁，曹操方知中了疑兵之计。长坂桥头杀气生，横枪立马眼圆睁。一声好似轰雷震，独退曹家百万兵。",
     @"苏双、张世平赠刘备好马五十匹、金银五百两、好铁一千斤，以用来打造武器。刘备命打铁高匠造双股剑。关云长造青龙偃月刀一柄，又名“冷艳锯”，重八十二斤。张飞造丈八点钢矛一把。",
     @"为防曹操谋害，刘备下处后院种菜，以为韬晦之计。一日曹操忽请刘备饮酒。两人煮酒对饮，展开论英雄的对话。曹操在对刘备所指的英雄一一否决后，指自己和刘备为英雄。刘备闻言失惊落筷。时值雷声大作，刘备忙借惧雷掩饰失惊的情状，由此解除了曹操的疑惑。",
     @"张角、张梁、张宝约定起义。但起义之事败露，张角当机立断，星夜举兵，他自称“天公将军”，张宝称为“地公将军”，张梁为“人公将军”，并公告天下：“今汉运将终，大圣人出。我等皆宜顺天从正，以乐太平。”天下百姓，纷纷响应，头裹黄巾而跟随张角造反的达四五十万之众。",
     @"张角、张梁、张宝约定起义。但起义之事败露，张角当机立断，星夜举兵，他自称“天公将军”，张宝称为“地公将军”，张梁为“人公将军”，并公告天下：“今汉运将终，大圣人出。我等皆宜顺天从正，以乐太平。”天下百姓，纷纷响应，头裹黄巾而跟随张角造反的达四五十万之众。",
     @"张角、张梁、张宝约定起义。但起义之事败露，张角当机立断，星夜举兵，他自称“天公将军”，张宝称为“地公将军”，张梁为“人公将军”，并公告天下：“今汉运将终，大圣人出。我等皆宜顺天从正，以乐太平。”天下百姓，纷纷响应，头裹黄巾而跟随张角造反的达四五十万之众。",
     
     @"闯关成功",
     nil];
     
     requestArry = [NSArray arrayWithObjects:
     
     @"“败走麦城”描述的是哪个人物？",
     @"“苍天已死，黄天当立；岁在甲子，天下大吉。是谁说的？",
     @"舌战群儒的是？",
     @"“良禽择木而栖，贤臣择主而事”是对谁说的？",
     @"“宁教我负天下人，不叫天下人负我”是谁说的？",
     @"青梅煮酒论英雄,“今天下英雄，惟使君与操耳!”是谁说的？",
     @"“燕雀安知鸿鹄之志哉！”是谁说的?",
     @"持青龙偃月刀，温酒斩华雄的三国名将是？",
     @"赤兔马是谁的坐骑？",
     @"单骑救阿斗的是？",
     @"华容道为报恩释放曹操的是？",
     @"酒尚温时斩华雄的是？",
     @"刘备三顾茅庐是请谁？",
     @"能和刘备、关羽、张飞对打不输的猛将是？",
     @"怒鞭督邮的是？",
     @"赔了夫人又折兵的人是？",
     @"上山采药遇仙人得《太平要术》，自称“太平道人”的是？",
     @"使“空城计”的是谁？",
     @"事迹“草船借箭”是谁的计谋？",
     @"事迹“过五关斩六将”描述的是哪个人物？",
     @"事迹“千里走单骑”描述的是哪个人物？",
     @"双股剑是谁的武器？",
     @"司徒王允翘设连环计将貂蝉献给谁？",
     @"长坂坡一声吼退敌的猛将是？",
     @"丈八点钢矛是谁的武器？",
     @"字号玄德的是？煮酒论英雄",
     @"自称“地公将军”的是？",
     @"自称“人公将军”的是？",
     @"自称“天公将军”的是？",
     @"闯关成功",
     nil];
     */
    //单指单击
    UITapGestureRecognizer *singleFingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(handleSingleFingerEvent:)];
    singleFingerOne.numberOfTouchesRequired = 1; //手指数
    singleFingerOne.numberOfTapsRequired = 1; //tap次数
    singleFingerOne.delegate = self;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backp.png"]];
    [image addGestureRecognizer:singleFingerOne ];
    
    
    
    //   self.request.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bwijing.png"]];
    //存取文件路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [path objectAtIndex:0];
    
    NSString *goldHis = [documents stringByAppendingPathComponent:@"goldhis.plist"];
    NSDictionary *goldHisdic = [NSDictionary dictionaryWithObjectsAndKeys:
                                dayCion,sysDate,nil];
    
    
    
    filepath = [documents stringByAppendingPathComponent:@"asw.plist"];
    [aswRequest writeToFile:filepath atomically:YES];
    
    NSString *gamepath = [documents stringByAppendingPathComponent:@"gameStatu.plist"];
    herofile = [documents stringByAppendingPathComponent:@"herofile.plist"];
    wxfilepath = [documents stringByAppendingPathComponent:@"weixincion.plist"];
    NSArray *rt = [NSArray arrayWithContentsOfFile:herofile];
    
    if (rt  == nil) {
        NSArray *arry = [NSArray arrayWithObject:@"初出茅庐"];
        heroArry = [[NSMutableArray alloc]init];
        heroArry = [NSMutableArray arrayWithArray:arry];
        [heroArry writeToFile:herofile atomically:YES];
    }
    
    heroArry = [NSMutableArray arrayWithContentsOfFile:herofile];
    if (dayUmeng != nil) {
        [heroArry addObject:dayUmeng];
        NSSet *set = [NSSet setWithArray:heroArry];
        NSArray *setArry = [set allObjects];
        heroArry = [NSMutableArray arrayWithArray:setArry];
        [heroArry writeToFile:herofile atomically:YES];
    }
    
    
    
    
    
    
    
    
    
    NSDictionary *xmlre = [NSDictionary dictionaryWithContentsOfFile:gamepath];
    
    if ([xmlre valueForKey:@"1"]==0) {
        guanka=1;
        self.jinyuanbao=1000;
        guank.text = [NSString stringWithFormat:@"%d",guanka];
        yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
    }
    else
    {
        guank.text = [NSString stringWithFormat:@"%@",[xmlre valueForKey:@"1"]];
        yuanbao.text = [NSString stringWithFormat:@"%@",[xmlre valueForKey:@"2"]];
        guanka = [[xmlre valueForKey:@"1"]intValue];
        self.jinyuanbao = [[xmlre valueForKey:@"2"]intValue];
    }
    
    NSDictionary *goldRt = [NSDictionary dictionaryWithContentsOfFile:goldHis];
    if ([goldRt valueForKey:sysDate] ==0) {
        
        int y = [dayCion integerValue];
        self.jinyuanbao = _jinyuanbao + y;
        yuanbao.text = [NSString stringWithFormat:@"%d",_jinyuanbao];
        [self gamestatus];
        [goldHisdic writeToFile:goldHis atomically:YES];
    }
    
    
    
    //屏幕尺寸
    CGRect rect = [ UIScreen mainScreen ].applicationFrame;
    CGSize size = rect.size;
    //    CGFloat width = size.width;
    //    CGFloat height = size.height;
    heightFour = size.height;
    
    int imgNum = guanka-1;
    image.image = [UIImage imageNamed:[imageArry objectAtIndex:imgNum]];
    if (heightFour>480) {
        image.frame = CGRectMake(70, 60, 220, 200);
        CGRect frame = request.frame;
        frame.origin.y = 320;
        request.frame = frame;
        CGRect frame1 = bt1.frame;
        frame1.origin.y = 398;
        bt1.frame=frame1;
        CGRect frame2 = bt2.frame;
        frame2.origin.y = 398;
        bt2.frame=frame2;
        CGRect frame3 = bt3.frame;
        frame3.origin.y = 398;
        bt3.frame=frame3;
        CGRect frame4 = bt4.frame;
        frame4.origin.y = 398;
        bt4.frame=frame4;
        CGRect frame5 = bt5.frame;
        frame5.origin.y = 458;
        bt5.frame=frame5;
        CGRect frame6 = bt6.frame;
        frame6.origin.y = 458;
        bt6.frame=frame6;
        CGRect frame7 = bt7.frame;
        frame7.origin.y = 458;
        bt7.frame=frame7;
        CGRect frame8 = bt8.frame;
        frame8.origin.y = 458;
        bt8.frame=frame8;
    }
    else
    {
        image.frame = CGRectMake(50, 40, 220, 200);
        
    }
    
    
    
    [image.layer setMasksToBounds:YES];
    [image.layer setCornerRadius:45.0];
    [bt2 setBackgroundImage:[UIImage imageNamed:@"daan2"] forState:UIControlStateNormal];
    [bt1 setBackgroundImage:[UIImage imageNamed:@"daan2"] forState:UIControlStateNormal];
    [bt3 setBackgroundImage:[UIImage imageNamed:@"daan2"] forState:UIControlStateNormal];
    [bt4 setBackgroundImage:[UIImage imageNamed:@"daan2"] forState:UIControlStateNormal];
    [bt5 setBackgroundImage:[UIImage imageNamed:@"daan2"] forState:UIControlStateNormal];
    [bt6 setBackgroundImage:[UIImage imageNamed:@"daan2"] forState:UIControlStateNormal];
    [bt7 setBackgroundImage:[UIImage imageNamed:@"daan2"] forState:UIControlStateNormal];
    [bt8 setBackgroundImage:[UIImage imageNamed:@"daan2"] forState:UIControlStateNormal];
    
    [self newgame];
    
    
    [self playSound];
    UMUFPBannerView *banner = [[UMUFPBannerView alloc] init];
    [self bannerWillAppear:banner];
    [self canBecomeFirstResponder];
    
    
    
    
    
}


#pragma mark -
#pragma mark - MotionShake Event
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if(motion == UIEventSubtypeMotionShake){
        [self newgame];
        
        NSLog(@"Shake!!!!!!!!!!!");
    }
}

-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
}

-(void)viewDidAppear:(BOOL)animated{
    [self canBecomeFirstResponder];
}


-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(void)playSound
{
    
    NSString *mp3File = [[NSBundle mainBundle]pathForResource:@"aGreatGiantPlay" ofType:@"mp3"];
    
    if (nil != audioplay) {
        [audioplay stop];//<----在释放前需要先停止播放器
        
    }
    
    audioplay = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:mp3File] error:NULL];
    audioplay.numberOfLoops = -1;
    [audioplay play];
}

#pragma mark -
#pragma mark - newgame Event

- (void)newgame{
    
    [self gamestatus];
    int button = arc4random()  % 7;
    int a = arc4random()  % 137;
    int b = arc4random()  % 137;
    int c = arc4random()  % 137;
    int d = arc4random()  % 137;
    int e = arc4random()  % 137;
    int f = arc4random()  % 137;
    int g = arc4random()  % 137;
    
    
    
    request.text = [requestArry objectAtIndex:guanka-1] ;
    request.font =  [UIFont fontWithName:@"经典繁毛楷" size:20];
    if (heightFour>480) {
        CGRect frame = request.frame;
        frame.origin.y = 320;
        request.frame = frame;
        
    }
    if (button == 0) {
        [bt1 setTitle:[answerArry objectAtIndex:guanka-1] forState:normal];
        [bt2 setTitle:[answerArry objectAtIndex:a] forState:normal];
        [bt3 setTitle:[answerArry objectAtIndex:b] forState:normal];
        [bt4 setTitle:[answerArry objectAtIndex:c] forState:normal];
        [bt5 setTitle:[answerArry objectAtIndex:d] forState:normal];
        [bt6 setTitle:[answerArry objectAtIndex:e] forState:normal];
        [bt7 setTitle:[answerArry objectAtIndex:f] forState:normal];
        [bt8 setTitle:[answerArry objectAtIndex:g] forState:normal];
        
    }
    else if (button == 1) {
        [bt2 setTitle:[answerArry objectAtIndex:guanka-1] forState:normal];
        [bt1 setTitle:[answerArry objectAtIndex:a] forState:normal];
        [bt3 setTitle:[answerArry objectAtIndex:b] forState:normal];
        [bt4 setTitle:[answerArry objectAtIndex:c] forState:normal];
        [bt5 setTitle:[answerArry objectAtIndex:d] forState:normal];
        [bt6 setTitle:[answerArry objectAtIndex:e] forState:normal];
        [bt7 setTitle:[answerArry objectAtIndex:f] forState:normal];
        [bt8 setTitle:[answerArry objectAtIndex:g] forState:normal];
    }
    else if (button == 2) {
        [bt3 setTitle:[answerArry objectAtIndex:guanka-1] forState:normal];
        [bt1 setTitle:[answerArry objectAtIndex:a] forState:normal];
        [bt2 setTitle:[answerArry objectAtIndex:b] forState:normal];
        [bt4 setTitle:[answerArry objectAtIndex:c] forState:normal];
        [bt5 setTitle:[answerArry objectAtIndex:d] forState:normal];
        [bt6 setTitle:[answerArry objectAtIndex:e] forState:normal];
        [bt7 setTitle:[answerArry objectAtIndex:f] forState:normal];
        [bt8 setTitle:[answerArry objectAtIndex:g] forState:normal];
    }
    else   if (button == 3) {
        [bt4 setTitle:[answerArry objectAtIndex:guanka-1]  forState:normal];
        [bt1 setTitle:[answerArry objectAtIndex:a] forState:normal];
        [bt2 setTitle:[answerArry objectAtIndex:b] forState:normal];
        [bt3 setTitle:[answerArry objectAtIndex:c] forState:normal];
        [bt5 setTitle:[answerArry objectAtIndex:d] forState:normal];
        [bt6 setTitle:[answerArry objectAtIndex:e] forState:normal];
        [bt7 setTitle:[answerArry objectAtIndex:f] forState:normal];
        [bt8 setTitle:[answerArry objectAtIndex:g] forState:normal];    }
    else   if (button == 4) {
        [bt5 setTitle:[answerArry objectAtIndex:guanka-1]  forState:normal];
        [bt1 setTitle:[answerArry objectAtIndex:a] forState:normal];
        [bt2 setTitle:[answerArry objectAtIndex:b] forState:normal];
        [bt3 setTitle:[answerArry objectAtIndex:c] forState:normal];
        [bt4 setTitle:[answerArry objectAtIndex:d] forState:normal];
        [bt6 setTitle:[answerArry objectAtIndex:e] forState:normal];
        [bt7 setTitle:[answerArry objectAtIndex:f] forState:normal];
        [bt8 setTitle:[answerArry objectAtIndex:g] forState:normal];
    }
    else   if (button == 5) {
        [bt6 setTitle:[answerArry objectAtIndex:guanka-1]  forState:normal];
        [bt1 setTitle:[answerArry objectAtIndex:a] forState:normal];
        [bt2 setTitle:[answerArry objectAtIndex:b] forState:normal];
        [bt3 setTitle:[answerArry objectAtIndex:c] forState:normal];
        [bt4 setTitle:[answerArry objectAtIndex:d] forState:normal];
        [bt5 setTitle:[answerArry objectAtIndex:e] forState:normal];
        [bt7 setTitle:[answerArry objectAtIndex:f] forState:normal];
        [bt8 setTitle:[answerArry objectAtIndex:g] forState:normal];
    }
    else   if (button == 6) {
        [bt7 setTitle:[answerArry objectAtIndex:guanka-1]  forState:normal];
        [bt1 setTitle:[answerArry objectAtIndex:a] forState:normal];
        [bt2 setTitle:[answerArry objectAtIndex:b] forState:normal];
        [bt3 setTitle:[answerArry objectAtIndex:c] forState:normal];
        [bt4 setTitle:[answerArry objectAtIndex:d] forState:normal];
        [bt5 setTitle:[answerArry objectAtIndex:e] forState:normal];
        [bt6 setTitle:[answerArry objectAtIndex:f] forState:normal];
        [bt8 setTitle:[answerArry objectAtIndex:g] forState:normal];
    }
    else   if (button == 7) {
        [bt8 setTitle:[answerArry objectAtIndex:guanka-1]  forState:normal];
        [bt1 setTitle:[answerArry objectAtIndex:a] forState:normal];
        [bt2 setTitle:[answerArry objectAtIndex:b] forState:normal];
        [bt3 setTitle:[answerArry objectAtIndex:c] forState:normal];
        [bt4 setTitle:[answerArry objectAtIndex:d] forState:normal];
        [bt5 setTitle:[answerArry objectAtIndex:e] forState:normal];
        [bt6 setTitle:[answerArry objectAtIndex:f] forState:normal];
        [bt7 setTitle:[answerArry objectAtIndex:g] forState:normal];
    }
    
    returnCode = @"OK";
    
    
    
    NSString *imagePng =[imageArry objectAtIndex:guanka-1];
    image.image = [UIImage imageNamed:imagePng];
    if(heightFour>480){
        image.frame = CGRectMake(70, 60, 220, 200);
    }
    else
        image.frame = CGRectMake(50, 40, 220, 200);
    [image.layer setMasksToBounds:YES];
    [image.layer setCornerRadius:45.0];
    bt1.titleLabel.font =[UIFont fontWithName:@"经典繁毛楷" size:26];
    bt2.titleLabel.font =[UIFont fontWithName:@"经典繁毛楷" size:26];
    bt3.titleLabel.font =[UIFont fontWithName:@"经典繁毛楷" size:26];
    bt4.titleLabel.font =[UIFont fontWithName:@"经典繁毛楷" size:26];
    bt5.titleLabel.font =[UIFont fontWithName:@"经典繁毛楷" size:26];
    bt6.titleLabel.font =[UIFont fontWithName:@"经典繁毛楷" size:26];
    bt7.titleLabel.font =[UIFont fontWithName:@"经典繁毛楷" size:26];
    bt8.titleLabel.font =[UIFont fontWithName:@"经典繁毛楷" size:26];
    
    if (heightFour>480) {
        
        CGRect frame1 = bt1.frame;
        frame1.origin.y = 398;
        bt1.frame=frame1;
        CGRect frame2 = bt2.frame;
        frame2.origin.y = 398;
        bt2.frame=frame2;
        CGRect frame3 = bt3.frame;
        frame3.origin.y = 398;
        bt3.frame=frame3;
        CGRect frame4 = bt4.frame;
        frame4.origin.y = 398;
        bt4.frame=frame4;
        CGRect frame5 = bt5.frame;
        frame5.origin.y = 458;
        bt5.frame=frame5;
        CGRect frame6 = bt6.frame;
        frame6.origin.y = 458;
        bt6.frame=frame6;
        CGRect frame7 = bt7.frame;
        frame7.origin.y = 458;
        bt7.frame=frame7;
        CGRect frame8 = bt8.frame;
        frame8.origin.y = 458;
        bt8.frame=frame8;
    }
    
    
    if ( guanka == 10 ) {
        [heroArry addObject:@"小试牛刀"];
        NSSet *set = [NSSet setWithArray:heroArry];
        NSArray *setArry = [set allObjects];
        heroArry = [NSMutableArray arrayWithArray:setArry];
        
        [heroArry writeToFile:herofile atomically:YES];
    }
    else if  (guanka == 20) {
        [heroArry addObject:@"初战告捷"];
        NSSet *set = [NSSet setWithArray:heroArry];
        NSArray *setArry = [set allObjects];
        heroArry = [NSMutableArray arrayWithArray:setArry];
        
        [heroArry writeToFile:herofile atomically:YES];
    }
    else if  (guanka == 30) {
        [heroArry addObject:@"有勇有谋"];
        NSSet *set = [NSSet setWithArray:heroArry];
        NSArray *setArry = [set allObjects];
        heroArry = [NSMutableArray arrayWithArray:setArry];
        
        [heroArry writeToFile:herofile atomically:YES];
    }
    else if  (guanka == 50) {
        [heroArry addObject:@"常胜将军"];
        NSSet *set = [NSSet setWithArray:heroArry];
        NSArray *setArry = [set allObjects];
        heroArry = [NSMutableArray arrayWithArray:setArry];
        
        [heroArry writeToFile:herofile atomically:YES];
    }
    else if  (guanka == 80) {
        [heroArry addObject:@"胜券在握"];
        NSSet *set = [NSSet setWithArray:heroArry];
        NSArray *setArry = [set allObjects];
        heroArry = [NSMutableArray arrayWithArray:setArry];
        
        [heroArry writeToFile:herofile atomically:YES];
    }
    
}





#pragma mark -
#pragma mark - answerClick Event

- (IBAction)answerClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    [self xml];
    NSLog(@"BTN.%d",btn.tag);
    NSLog(@"TITLE.%@",bt1.currentTitle);
    NSLog(@"TITLE.%@",bt2.currentTitle);
    NSLog(@"TITLE.%@",bt3.currentTitle);
    NSLog(@"TITLE.%@",bt4.currentTitle);
    NSLog(@"TITLE.%@",bt5.currentTitle);
    NSLog(@"TITLE.%@",bt6.currentTitle);
    NSLog(@"TITLE.%@",bt7.currentTitle);
    NSLog(@"TITLE.%@",bt8.currentTitle);
    NSString *message = [tishiArry objectAtIndex:guanka-1];
    
    
    
    if (self.jinyuanbao<0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"金币不够了，向微信朋友求助可以免费赠送金币哦"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles: nil];
        [alert show];
        
    }
    else
    {
        switch (btn.tag) {
            case 1:
                if (guanka >= 138)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通关" message:message delegate:self
                                                          cancelButtonTitle:@"恭喜"
                                                          otherButtonTitles: nil];
                    
                    
                    [alert show];
                    
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                }
                else if ([bt1.currentTitle isEqualToString:key])
                {
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:message delegate:self
                                                          cancelButtonTitle:@"下一关"
                                                          otherButtonTitles: @"人物事迹",nil];
                    [alert show];
                    alert.tag = 2;
                    UIView *additonBackgroundView = [[UIView alloc]init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    guanka = guanka + 1;
                    self.jinyuanbao = self.jinyuanbao + 100;
                    [self gamestatus];
                    NSLog(@"关卡：%d",guanka);
                    guank.text =  [NSString stringWithFormat:@"%d", guanka];
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self newgame];
                    
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:@"很遗憾，您答错了。" delegate:self
                                                          cancelButtonTitle:@"再接再励"
                                                          otherButtonTitles: nil];
                    [alert show];
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    self.jinyuanbao = self.jinyuanbao - 100;
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self gamestatus];
                }
                
                break;
            case 2:
                if (guanka >= 138 )
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通关" message:message delegate:self
                                                          cancelButtonTitle:@"恭喜"
                                                          otherButtonTitles: nil];
                    
                    
                    [alert show];
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    
                    
                    
                }
                else if ([bt2.currentTitle isEqualToString:key])
                {
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:message delegate:self
                                                          cancelButtonTitle:@"下一关"
                                                          otherButtonTitles:@"人物事迹", nil];
                    [alert show];
                    alert.tag = 2;
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    guanka = guanka + 1;
                    self.jinyuanbao = self.jinyuanbao + 100;
                    [self gamestatus];
                    NSLog(@"关卡：%d",guanka);
                    guank.text =  [NSString stringWithFormat:@"%d", guanka];
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self newgame];
                    
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:@"很遗憾，您答错了。" delegate:self
                                                          cancelButtonTitle:@"再接再励"
                                                          otherButtonTitles: nil];
                    [alert show];
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    self.jinyuanbao = self.jinyuanbao - 100;
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self gamestatus];
                }
                break;
            case 3:
                if (guanka >= 138 )
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通关" message:message delegate:self
                                                          cancelButtonTitle:@"恭喜"
                                                          otherButtonTitles: nil];
                    
                    
                    [alert show];
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    
                    
                    
                }
                else if ([bt3.currentTitle isEqualToString:key])
                {
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:message delegate:self
                                                          cancelButtonTitle:@"下一关"
                                                          otherButtonTitles: @"人物事迹",nil];
                    [alert show];
                    alert.tag = 2;
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    guanka = guanka + 1;
                    self.jinyuanbao = self.jinyuanbao + 100;
                    [self gamestatus];
                    NSLog(@"关卡：%d",guanka);
                    guank.text =  [NSString stringWithFormat:@"%d", guanka];
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self newgame];
                    
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:@"很遗憾，您答错了。" delegate:self
                                                          cancelButtonTitle:@"再接再励"
                                                          otherButtonTitles: nil];
                    [alert show];
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    self.jinyuanbao = self.jinyuanbao - 100;
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self gamestatus];
                }
                break;
            case 4:
                if (guanka >= 138 )
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通关" message:message delegate:self
                                                          cancelButtonTitle:@"恭喜"
                                                          otherButtonTitles: nil];
                    
                    
                    [alert show];
                    
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    
                    
                    
                }
                else if ([bt4.currentTitle isEqualToString:key])
                {
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:message delegate:self
                                                          cancelButtonTitle:@"下一关"
                                                          otherButtonTitles:@"人物事迹", nil];
                    [alert show];
                    alert.tag = 2;
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    guanka = guanka + 1;
                    self.jinyuanbao = self.jinyuanbao + 100;
                    [self gamestatus];
                    NSLog(@"关卡：%d",guanka);
                    guank.text =  [NSString stringWithFormat:@"%d", guanka];
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self newgame];
                    
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:@"很遗憾，您答错了。" delegate:self
                                                          cancelButtonTitle:@"再接再励"
                                                          otherButtonTitles: nil];
                    [alert show];
                    
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    self.jinyuanbao = self.jinyuanbao - 100;
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self gamestatus];
                }
                break;
            case 5:
                if (guanka >= 138 )
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通关" message:message delegate:self
                                                          cancelButtonTitle:@"恭喜"
                                                          otherButtonTitles: nil];
                    
                    
                    [alert show];
                    
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    
                    
                    
                }
                else if ([bt5.currentTitle isEqualToString:key])
                {
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:message delegate:self
                                                          cancelButtonTitle:@"下一关"
                                                          otherButtonTitles: @"人物事迹",nil];
                    [alert show];
                    alert.tag = 2;
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    guanka = guanka + 1;
                    self.jinyuanbao = self.jinyuanbao + 100;
                    [self gamestatus];
                    NSLog(@"关卡：%d",guanka);
                    guank.text =  [NSString stringWithFormat:@"%d", guanka];
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self newgame];
                    
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:@"很遗憾，您答错了。" delegate:self
                                                          cancelButtonTitle:@"再接再励"
                                                          otherButtonTitles: nil];
                    [alert show];
                    
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    self.jinyuanbao = self.jinyuanbao - 100;
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self gamestatus];
                }
                break;
                
            case 6:
                if (guanka >= 138 )
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通关" message:message delegate:self
                                                          cancelButtonTitle:@"恭喜"
                                                          otherButtonTitles: nil];
                    
                    
                    [alert show];
                    
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    
                    
                    
                }
                else if ([bt6.currentTitle isEqualToString:key])
                {
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:message delegate:self
                                                          cancelButtonTitle:@"下一关"
                                                          otherButtonTitles:@"人物事迹", nil];
                    [alert show];
                    alert.tag = 2;
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    guanka = guanka + 1;
                    self.jinyuanbao = self.jinyuanbao + 100;
                    [self gamestatus];
                    NSLog(@"关卡：%d",guanka);
                    guank.text =  [NSString stringWithFormat:@"%d", guanka];
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self newgame];
                    
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:@"很遗憾，您答错了。" delegate:self
                                                          cancelButtonTitle:@"再接再励"
                                                          otherButtonTitles: nil];
                    [alert show];
                    
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    self.jinyuanbao = self.jinyuanbao - 100;
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self gamestatus];
                }
                break;
                
            case 7:
                if (guanka >= 138 )
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通关" message:message delegate:self
                                                          cancelButtonTitle:@"恭喜"
                                                          otherButtonTitles: nil];
                    
                    
                    [alert show];
                    
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    
                    
                    
                }
                else if ([bt7.currentTitle isEqualToString:key])
                {
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:message delegate:self
                                                          cancelButtonTitle:@"下一关"
                                                          otherButtonTitles: @"人物事迹",nil];
                    [alert show];
                    alert.tag = 2;
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    guanka = guanka + 1;
                    self.jinyuanbao = self.jinyuanbao + 100;
                    [self gamestatus];
                    NSLog(@"关卡：%d",guanka);
                    guank.text =  [NSString stringWithFormat:@"%d", guanka];
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self newgame];
                    
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:@"很遗憾，您答错了。" delegate:self
                                                          cancelButtonTitle:@"再接再励"
                                                          otherButtonTitles: nil];
                    [alert show];
                    
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    self.jinyuanbao = self.jinyuanbao - 100;
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self gamestatus];
                }
                break;
                
            case 8:
                if (guanka >= 138 )
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通关" message:message delegate:self
                                                          cancelButtonTitle:@"恭喜"
                                                          otherButtonTitles: nil];
                    
                    
                    [alert show];
                    
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    
                    
                    
                }
                else if ([bt8.currentTitle isEqualToString:key])
                {
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:message delegate:self
                                                          cancelButtonTitle:@"下一关"
                                                          otherButtonTitles: @"人物事迹",nil];
                    [alert show];
                    alert.tag = 2;
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    
                    guanka = guanka + 1;
                    self.jinyuanbao = self.jinyuanbao + 100;
                    [self gamestatus];
                    NSLog(@"关卡：%d",guanka);
                    guank.text =  [NSString stringWithFormat:@"%d", guanka];
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self newgame];
                    
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"事迹典故" message:@"很遗憾，您答错了。" delegate:self
                                                          cancelButtonTitle:@"再接再励"
                                                          otherButtonTitles: nil];
                    [alert show];
                    
                    UIView *additonBackgroundView = [[UIView alloc] init];
                    additonBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Buttonpng.png"]]; //添加背景图片
                    
                    [alert insertSubview:additonBackgroundView atIndex:1 ];
                    self.jinyuanbao = self.jinyuanbao - 100;
                    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
                    [self gamestatus];
                }
                break;
                
            default:
                break;
        }
    }
    
    
    
}


/*
 - (void)willPresentAlertView:(UIAlertView *)alertView{
 UIView * view = [alertView.subviews objectAtIndex:1];
 if([view isKindOfClass:[UILabel class]]){
 UILabel* label = (UILabel*) view;
 label.textColor = [UIColor cyanColor];
 }
 UIView * view1 = [alertView.subviews objectAtIndex:2];
 if([view1 isKindOfClass:[UILabel class]]){
 UILabel* label = (UILabel*) view1;
 label.textColor = [UIColor cyanColor];
 }
 UIView * view2 = [alertView.subviews objectAtIndex:3];
 if([view2 isKindOfClass:[UILabel class]]){
 UILabel* label = (UILabel*) view2;
 label.textColor = [UIColor cyanColor];
 }
 
 }
 */


- (IBAction)newgameon:(id)sender
{
    [NSThread sleepForTimeInterval:0.5];
    guanka = 1;
    guank.text =  [NSString stringWithFormat:@"%d", guanka];
    [self newgame];
    NSString *imagePng =[imageArry objectAtIndex:guanka-1];
    image.image = [UIImage imageNamed:imagePng];
    
    if(heightFour>480){
        image.frame = CGRectMake(70, 60, 220, 200);
    }
    else
        image.frame = CGRectMake(50, 40, 220, 200);
    
    [image.layer setMasksToBounds:YES];
    [image.layer setCornerRadius:45.0];
    
    [self gamestatus];
    
    //添加过渡效果
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction
                                 functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.view.layer addAnimation:transition forKey:nil];
    
}

- (void)sql
{
    NSLog(@"%@", [self dataFilePath]);
    sqlite3 *database;
    if (sqlite3_open([[self dataFilePath] UTF8String], &database)
        != SQLITE_OK) {
        sqlite3_close(database);
        
        NSLog(@"Failed to open database");
    }
    
    
    
    
    // Useful C trivia: If two inline strings are separated by nothing
    // but whitespace (including line breaks), they are concatenated into
    // a single string:
    NSString *createSQL = @"CREATE TABLE IF NOT EXISTS reqans (guanka INTEGER PRIMARY KEY, answer TEXT,request TEXT, value INTEGER);";
    char *errorMsg;
    if (sqlite3_exec (database, [createSQL UTF8String],
                      NULL, NULL, &errorMsg) != SQLITE_OK) {
        sqlite3_close(database);
        NSLog(@"Error creating table: %s",errorMsg);
    }
    
    
    char *update = "INSERT OR REPLACE INTO reqans (guanka, answer,request,value) VALUES (?,?,?,?);";
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(database, update, -1, &stmt, nil) == SQLITE_OK) {
        sqlite3_bind_int(stmt, 1, 1);
        sqlite3_bind_text(stmt, 2, [answer01 UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 3, [request1 UTF8String], -1, NULL);
        sqlite3_bind_int(stmt, 4, 10);
        
    }
    if (sqlite3_step(stmt) != SQLITE_DONE)
        NSAssert(0, @"Error updating table: %s", errorMsg);
    NSString *sqlquery =[NSString stringWithFormat:@"SELECT answer FROM reqans WHERE guanka = %d", guanka];
    const char *query = "SELECT answer FROM reqans WHERE guanka = 1";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [sqlquery UTF8String],
                           -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int row = sqlite3_column_int(statement, 0);
            char *rowData = (char *)sqlite3_column_text(statement, 1);
            
            NSString *fieldValue = [[NSString alloc]
                                    initWithUTF8String:rowData];
            sqlAnswer = fieldValue;
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(database);
    
    
    
}
- (NSString *)dataFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(
                                                         NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"sanguo.sqlite3"];
}

-(void) xml
{
    
    
    NSString *xmlkey = [NSString stringWithFormat:@"%d",guanka];
    NSDictionary *xmlre = [NSDictionary dictionaryWithContentsOfFile:filepath];
    key = [xmlre valueForKey:xmlkey];
    NSLog(@"key %@",key);
    
}

-(void) gamestatus
{
    
    
    NSString *yuanbaoNum = [NSString stringWithFormat:@"%d",self.jinyuanbao];
    NSString *guankaNum = [NSString stringWithFormat:@"%d", guanka];
    
    NSDictionary *statu =[NSDictionary dictionaryWithObjectsAndKeys:guankaNum,@"1",yuanbaoNum,@"2",dayUmeng,dayHero,nil];
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [path objectAtIndex:0];
    gameStatufilepath = [documents stringByAppendingPathComponent:@"gameStatu.plist"];
    [statu writeToFile:gameStatufilepath atomically:YES];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark -
#pragma mark - weixin
- (IBAction) sendWexin{
    
    
    CGImageRef UIGetScreenImage();
    CGImageRef img = UIGetScreenImage();
    scImg=[UIImage imageWithCGImage:img];
    UIImageWriteToSavedPhotosAlbum(scImg, self, nil, nil);
    
    //   NSData *screenshotPNG = UIImagePNGRepresentation(scImg);
    
    // NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //  NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //  NSError *error = nil;
    //  [screenshotPNG writeToFile:[documentsDirectory stringByAppendingPathComponent:@"screenshot.png"] options:NSAtomicWrite error:&error];
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"微信"
                                                    message:@"选择分享类型"
                                                   delegate:self
                                          cancelButtonTitle:@"朋友"
                                          otherButtonTitles: @"朋友圈",@"图片",nil];
    [alert show];
    alert.tag = 1;
    
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView.tag==1) {
        [MobClick event:@"weixin"];
        if (buttonIndex == 0) {
            
            NSLog(@"点击了朋友按钮");
            if ([WXApi openWXApp]) {
                SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
                if (self.jinyuanbao>0) {
                    req.text = [NSString stringWithFormat:@"%@",request.text];
                }
                else
                {
                    req.text = [NSString stringWithFormat:@"我正在玩疯狂三国猜猜猜，寓教于乐，娱乐的同时熟识三国人物事迹典故:桃园三结义、三英战吕、三顾茅庐、草船借箭。还等什么？快来下载吧！"];
                }
                req.bText = YES;
                req.scene = WXSceneSession;
                
                NSDictionary *wxgoldRt = [NSDictionary dictionaryWithContentsOfFile:wxfilepath];
                if ([wxgoldRt valueForKey:sysDate] ==0) {
                    
                    self.jinyuanbao = _jinyuanbao + 500;
                    NSDictionary *wxCion = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"500",sysDate,nil];
                    
                    yuanbao.text = [NSString stringWithFormat:@"%d",_jinyuanbao];
                    
                    [wxCion writeToFile:wxfilepath atomically:YES];
                    
                    [self gamestatus];
                }
                
                
                
                [WXApi sendReq:req];
                
                
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"消息"
                                                                message:@"打开微信失败"
                                                               delegate:self
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles: nil];
                [alert show];
            }
            
        }
        
        else if(buttonIndex == 1){
            
            NSLog(@"点击了朋友圈按钮");
            if ([WXApi openWXApp]) {
                SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
                if (self.jinyuanbao>0) {
                    req.text = [NSString stringWithFormat:@"%@",request.text];
                }
                else
                {
                    req.text = [NSString stringWithFormat:@"我正在玩疯狂三国猜猜猜，寓教于乐，娱乐的同时熟识三国人物事迹典故:桃园三结义、三英战吕、三顾茅庐、草船借箭。还等什么？快来下载吧！"];
                }
                req.bText = YES;
                req.scene = WXSceneTimeline;
                
                NSDictionary *wxgoldRt = [NSDictionary dictionaryWithContentsOfFile:wxfilepath];
                if ([wxgoldRt valueForKey:sysDate] ==0) {
                    
                    self.jinyuanbao = _jinyuanbao + 500;
                    NSDictionary *wxCion = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"500",sysDate,nil];
                    
                    yuanbao.text = [NSString stringWithFormat:@"%d",_jinyuanbao];
                    
                    [wxCion writeToFile:wxfilepath atomically:YES];
                    
                    [self gamestatus];
                }
                
                
                [WXApi sendReq:req];
                
                
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"消息"
                                                                message:@"打开微信失败"
                                                               delegate:self
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles: nil];
                [alert show];
            }
            
        }
        else if (buttonIndex == 2) {
            
            NSLog(@"点击了图片按钮");
            if ([WXApi openWXApp]) {
                [self sendImage];
                
                NSDictionary *wxgoldRt = [NSDictionary dictionaryWithContentsOfFile:wxfilepath];
                if ([wxgoldRt valueForKey:sysDate] ==0) {
                    
                    self.jinyuanbao = _jinyuanbao + 500;
                    NSDictionary *wxCion = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"500",sysDate,nil];
                    
                    yuanbao.text = [NSString stringWithFormat:@"%d",_jinyuanbao];
                    
                    [wxCion writeToFile:wxfilepath atomically:YES];
                    
                    [self gamestatus];
                }
                
                
                
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"消息"
                                                                message:@"打开微信失败"
                                                               delegate:self
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles: nil];
                [alert show];
            }
            
        }
        
        
    }
    else if (alertView.tag==2)
    {
        if (buttonIndex == 1) {
        NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
        
        NSString *filePath =[resourcePath stringByAppendingPathComponent:@"heroInfo.plist"];
        
     
        //encoding:NSUTF8StringEncoding error:nil 这一段一定要加，不然中文字会乱码
        
        NSMutableDictionary *heroString=[NSMutableDictionary dictionaryWithContentsOfFile:filePath ];
        
        NSString *heroDis = [heroString valueForKey: key ];
            int leng = [heroDis length];
            if (leng == 0) {
                heroDis = key;
            }
        HeroViewController *heroView = [[HeroViewController alloc]init];
        heroView.heroTxt = heroDis;
            
        
        [self removeFromParentViewController];
        [self presentModalViewController:heroView animated:YES];
        }

    }
    
    
}

#pragma mark -
#pragma mark - TURN

- (void) sendTextContent
{
    
    if ([WXApi openWXApp]) {
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        if (self.jinyuanbao>0) {
            req.text = [NSString stringWithFormat:@"%@",request.text];
        }
        else
        {
            req.text = [NSString stringWithFormat:@"我正在玩疯狂三国猜猜猜，寓教于乐，娱乐的同时熟识三国人物事迹典故:桃园三结义、三英战吕、三顾茅庐、草船借箭。还等什么？快来下载吧！"];
        }
        req.bText = YES;
        req.scene = WXSceneTimeline;
        
        [WXApi sendReq:req];
        
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"消息"
                                                        message:@"打开微信失败"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles: nil];
        [alert show];
    }
    
    
}
- (IBAction) sendImage
{
    [self sendImageContent];
}

- (void) sendImageContent
{
    
    
    NSData *screenshotPNG = UIImagePNGRepresentation(scImg);
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"screenshot.png"]];
    
    WXImageObject *ext = [WXImageObject object];
    
    ext.imageData = screenshotPNG;
    
    //UIImage* image = [UIImage imageWithContentsOfFile:filePath];
    //  UIImage* image = [UIImage imageWithData:ext.imageData];
    //  ext.imageData = UIImagePNGRepresentation(image);
    
    //  UIImage* image = [UIImage imageNamed:@"res5thumb.png"];
    //  ext.imageData = UIImagePNGRepresentation(image);
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneTimeline;
    
    [WXApi sendReq:req];
    
}

- (void) RespImageContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"res5thumb.png"]];
    
    WXImageObject *ext = [WXImageObject object];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res5thumb" ofType:@"png"];
    ext.imageData = [NSData dataWithContentsOfFile:filePath];
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[GetMessageFromWXResp alloc] init] ;
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

- (void) sendLinkContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"专访张小龙：产品之上的世界观";
    message.description = @"微信的平台化发展方向是否真的会让这个原本简洁的产品变得臃肿？在国际化发展方向上，微信面临的问题真的是文化差异壁垒吗？腾讯高级副总裁、微信产品负责人张小龙给出了自己的回复。";
    [message setThumbImage:[UIImage imageNamed:@"res2.png"]];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = @"http://tech.qq.com/zt2012/tmtdecode/252.htm";
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [WXApi sendReq:req];
}

-(void) RespLinkContent
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"专访张小龙：产品之上的世界观";
    message.description = @"微信的平台化发展方向是否真的会让这个原本简洁的产品变得臃肿？在国际化发展方向上，微信面临的问题真的是文化差异壁垒吗？腾讯高级副总裁、微信产品负责人张小龙给出了自己的回复。";
    [message setThumbImage:[UIImage imageNamed:@"res2.png"]];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = @"http://tech.qq.com/zt2012/tmtdecode/252.htm";
    
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[GetMessageFromWXResp alloc] init];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}





- (IBAction) sendHelp{
    if (self.jinyuanbao<1000) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案"
                                                        message:@"金币不够"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"答案"
                                                        message:[tishiArry objectAtIndex:guanka-1]
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles: nil];
        [alert show];
        self.jinyuanbao=self.jinyuanbao-500;
        yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
    }
    
}

- (IBAction)showSheet:(id)sender{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"选项"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"金币答案提示"
                                  otherButtonTitles:@"英雄成就榜", @"历史轨迹",@"重置关卡",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
    actionSheet.tag = 3;
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag==3)
    {
        if (buttonIndex == 0){
            [self sendHelp ];
        }
        else if (buttonIndex == 1)
        {
            [self turnHero];
        }
        else if (buttonIndex == 2)
        {
            [self turnInfo];
        }
        else if (buttonIndex == 3)
        {
            [self newgameon:nil];
        }
    }
    
}



- (IBAction) turnInfo{
    DescriptionViewController *infoView = [[DescriptionViewController alloc]init];
    [self removeFromParentViewController];
    [self presentModalViewController:infoView animated:YES];
}

- (IBAction) turnHero{
    DescriptionHero *infoView = [[DescriptionHero alloc]init];
    [self removeFromParentViewController];
    [self presentModalViewController:infoView animated:YES];
}
- (IBAction) turnMe{
    DescriptionMe *infoView = [[DescriptionMe alloc]init];
    [self removeFromParentViewController];
    
    infoView.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    //   infoView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:infoView animated:YES];
    
}

#pragma mark -
#pragma mark - Umeng

- (void)onlineConfigCallBack:(NSNotification *)notification {
    NSLog(@"online config has fininshed and params = %@", notification.userInfo);
}

-(void)bannerWillAppear:(UMUFPBannerView *)banner;
{
    if (heightFour>480) {
        banner = [[UMUFPBannerView alloc] initWithFrame:CGRectMake(0, 518, 320, 50)
                                                 appKey:@"528cae4a5ff8fed1ac8f5cf8" slotId:nil currentViewController:self];
    }
    else
        banner = [[UMUFPBannerView alloc] initWithFrame:CGRectMake(0, 430, 320, 50) appKey:@"528cae4a5ff8fed1ac8f5cf8" slotId:nil currentViewController:self];
    [self.view addSubview:banner];
    [banner requestPromoterDataInBackground];
}
/*
 -(void)handleViewWillAppear:(UMUFPHandleView *)handleView
 {
 UMUFPHandleView *_mHandleView = [[UMUFPHandleView alloc] initWithFrame:CGRectMake(0, 416, 60, 44) appKey:@"4e2410be431fe348570000ad" slotId:nil currentViewController:self];
 _mHandleView.mContentType = ContentTypeApp;
 [self.view addSubview:_mHandleView];
 [_mHandleView requestPromoterDataInBackground];
 }
 */
#pragma mark -
#pragma mark - Blue

-(IBAction) btnConnect:(id) sender {
    [MobClick event:@"blue"];
    picker = [[GKPeerPickerController alloc] init];
    picker.delegate = self;
    picker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
    [connect setHidden:YES];
    [disconnect setHidden:NO];
    [sendData setHidden:NO];
    [picker show];
}

- (void)peerPickerController:(GKPeerPickerController *)picker
              didConnectPeer:(NSString *)peerID toSession:(GKSession *) session
{
    self.currentSession = session;
    session.delegate = self;
    [session setDataReceiveHandler:self withContext:nil];
    picker.delegate = nil;
    [picker dismiss];
    
}

- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker
{
    picker.delegate = nil;
    [connect setHidden:NO];
    [disconnect setHidden:YES];
    [sendData setHidden:YES];
    
}

-(IBAction) btnDisconnect:(id) sender {
    [self.currentSession disconnectFromAllPeers];
    [connect setHidden:NO];
    [disconnect setHidden:YES];
    [sendData setHidden:YES];
    currentSession = nil;
}

- (void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state {
    switch(state)
    {
        case GKPeerStateConnected:
            NSLog(@"connected");
            [sendData setHidden:NO];
            break;
        case GKPeerStateAvailable:
            NSLog(@"Available");
            break;
        case GKPeerStateUnavailable:
            NSLog(@"UNAvailable");
            break;
        case GKPeerStateConnecting:
            NSLog(@"connecting");
            break;
        case GKPeerStateDisconnected:
            NSLog(@"disconnected");
            currentSession = nil;
            break;
            [connect setHidden:NO];
            [disconnect setHidden:YES];
    }
}

- (void) mySendDataToPeers:(NSData *) data
{
    if (currentSession)
        [self.currentSession sendDataToAllPeers:data
                                   withDataMode:GKSendDataReliable
                                          error:nil];
}
-(IBAction) btnSend:(id) sender
{
    //---convert an NSString object to NSData---
    NSData* data;
    NSString *str = [NSString stringWithString:yuanbao.text];
    data = [str dataUsingEncoding: NSASCIIStringEncoding];
    [self mySendDataToPeers:data];
    self.jinyuanbao=self.jinyuanbao/2 + 50;
    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
    [self gamestatus];
    
}


- (void) receiveData:(NSData *)data fromPeer:(NSString *)peer inSession:(GKSession *)session context:(void *)context {
    //---convert the NSData to NSString---
    NSString* str;
    str = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    int x= [str intValue]/2;
    NSString *str2  =[NSString stringWithFormat:@"%d",x];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"收到免费赠送金币"
                                                    message:str2
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    self.jinyuanbao = self.jinyuanbao + x/2;
    yuanbao.text = [NSString stringWithFormat:@"%d",self.jinyuanbao];
    [self gamestatus];
    
}


- (void)handleSingleFingerEvent:(UITapGestureRecognizer *)sender
{
    if(sender.numberOfTapsRequired == 1) {
        //单指单击
        NSLog(@"单指单击");
        [self showSheet:nil];
    }
}

@end
