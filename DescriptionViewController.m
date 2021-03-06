//
//  DescriptionViewController.m
//  sanguocai
//
//  Created by Li Wen Jun on 13-11-24.
//  Copyright (c) 2013年 Li Wen Jun. All rights reserved.
//

#import "DescriptionViewController.h"

@interface DescriptionViewController ()

@end

@implementation DescriptionViewController
@synthesize bt;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        // Do any additional setup after loading the view from its nib.
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0,0,320,430)]; //初始化大小并自动释放
    self.textView.textColor = [UIColor blackColor];//设置textview里面的字体颜色
    
    self.textView.font = [UIFont fontWithName:@"Arial" size:18.0];//设置字体名字和字体大小
    
    self.textView.delegate = self;//设置它的委托方法
    
    self.textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
    
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        printf( "Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }  
    }
    
    self.textView.text = @"三国演义时间线。\n"
    "184年2月　黄巾起义。\n"
    "　　10月　张角病死。\n"
    "187年曹操任东郡太守。\n"
    "189年9月　董卓废少帝刘辩为弘农王，立九岁的陈留王刘协为帝，是为献帝。\n"
    "12月　曹操号召各镇诸侯共起讨伐董卓。\n"
    "190年1月　各路诸侯起兵反董卓。\n"
    "　　　　　董卓令李儒毒死弘农王(少帝)卒年15岁\n"
    "　　2月　董卓焚洛阳，迁都长安，洛阳古都残破\n"
    "　　　　　公孙度自立为辽东侯\n"
    "191年　　孙坚破董卓，斩华雄。\n"
    "　　　　　袁绍夺州牧韩馥的冀州，自领州牧。\n"
    "192年4月　王允设连环计，吕布杀死董卓。\n"
    "　　6月　李傕、郭汜围长安，杀王允，败吕布。\n"
    "　　　　　曹操击败青州黄巾军，收编为“青州兵”，实力得以壮大。\n"
    "　　　　　孙坚攻击刘表，战死。\n"
    "193年　　曹操东征徐州，大败陶谦。\n"
    "194年　　吕布攻击曹操。\n"
    "　　　　　陶谦病亡，刘备领徐州牧。\n"
    "195年10月曹操领兖州牧。\n"
    "　　　　　孙策攻打江东大败刘繇。\n"
    "　　　　　李傕、郭汜争夺献帝。\n"
    "196年7月　献帝在杨奉等人护送下，回长安。\n"
    "　　　　　吕布占徐州，刘备投曹操。\n"
    "　　　　　曹操始兴屯田，将献帝劫持到许。\n"
    "197年　　袁术在寿春称帝。\n"
    "　　　　　曹操讨伐张绣，失败。\n"
    "　　　　　袁绍占领冀、幽、青、并四州。\n"
    "198年9月　吕布攻打刘备，破小沛。\n"
    "　　12月　曹操擒杀吕布。\n"
    "　　　　　周瑜同小乔成亲。\n"
    "199年11月张绣投降曹操。\n"
    "　　　　　董承与王子服等密谋除曹操。\n"
    "　　　　　孙策袭取庐江，败刘勋。\n"
    "　　　　　刘备讨伐袁术，袁术病死。\n"
    "200年　　曹操诛杀董承一伙。\n"
    "　　　　　孙策遇刺身亡，孙权继位。\n"
    "　　　　　陈琳撰写讨曹檄文，官渡之战开始。\n"
    "　　　　　10月曹操偷袭乌巢。\n"
    "201年　　曹操败袁绍于仓亭。\n"
    "　　　　　刘备投奔刘表。\n"
    "202年5月　袁绍病死。\n"
    "203年　　孙权讨伐黄祖。\n"
    "204年　　曹操平定冀州。\n"
    "　　　　　辽东公孙度死，子公孙康继位。\n"
    "205年　　曹操平定青州。\n"
    "206年　　曹操平定并州。\n"
    "207年8月　曹操大破乌桓，消灭袁氏残余势力，统一了北方。\n"
    "　　　　　刘备三顾茅庐请出诸葛亮。\n"
    "　　　　　曹操从南匈奴赎回蔡文姬。\n"
    "208年6月　曹操封为汉丞相。\n"
    "　　7月　曹操南征刘表。\n"
    "　　8月　刘表病死。曹操杀孔融。\n"
    "　　9月　刘琮投降曹操。\n"
    "　　11月　赤壁之战，曹操被孙刘联军打败。\n"
    "209年10月刘备与孙权之妹成亲。\n"
    "210年　　曹操建成铜雀台。\n"
    "　　　　　周瑜亡。\n"
    "211年　　曹操攻破马超。\n"
    "　　　　　刘备入川。\n"
    "212年10月曹操南下进攻濡须口。\n"
    "　　　　　刘备驻扎霞萌关。\n"
    "　　　　　孙权移治秣陵，改名建业。\n"
    "213年5月　汉献帝封曹操为魏公，加九锡。\n"
    "214年5月　孙权攻破宛城。\n"
    "　　7月　孙权进攻合肥，被张辽击败。\n"
    "　　10月　献帝、伏后与国丈伏完密谋除曹操，事泄，曹操诛杀众人。\n"
    "　　　　　刘璋投降刘备，刘备自领益州牧。\n"
    "215年7月　曹操征张鲁。\n"
    "　　11月　张鲁降曹操。\n"
    "　　　　　逍遥津之战。曹操在濡须打败孙权。\n"
    "216年　　曹操称魏王。\n"
    "217年2月　曹操进攻濡须口，孙权败。\n"
    "218年　　曹彰大破乌桓军，鲜卑部落投降，北方平定。\n"
    "219年7月　刘备进位汉中王。\n"
    "　　　　　关羽水淹七军。\n"
    "　　10月　关羽失荆州，被孙权杀害。\n"
    "220年1月　曹操病亡。\n"
    "　　10月　曹丕称帝，建魏国。\n"
    "221年4月　刘备称帝。\n"
    "　　　　　刘备伐吴。张飞遇害。\n"
    "222年　　孙权称吴王。\n"
    "　　　　　彝陵之战，陆逊火烧连营，大败刘备。\n"
    "223年4月　刘备死于白帝城，刘禅继帝位。\n"
    "　　8月　曹丕五路伐蜀。\n"
    "　　　　　蜀吴重修和好。\n"
    "　　　　　雍闿叛乱。\n"
    "225年　　诸葛亮南征。诸葛亮七擒七纵孟获，平定蜀国南方。\n"
    "226年　　曹丕病亡，曹睿继位。\n"
    "12月　曹睿封司马懿为骠骑大将军。\n"
    "孙权围攻江夏，兵败。\n"
    "227年　　诸葛亮上书北伐。\n"
    "228年　　诸葛亮第一次北伐。\n"
    "　　　　　姜维降蜀。\n"
    "　　　　　马谡失街亭。\n"
    "　　　　　周鲂诈降诱曹魏攻吴，陆逊大败曹休。\n"
    "　　　　　诸葛亮第二次北伐。\n"
    "229年　　孙权称帝。\n"
    "　　　　　诸葛亮第三次北伐。\n"
    "230年　　吴派卫温、诸葛直航海到夷洲。\n"
    "　　　　　诸葛亮第四次北伐。曹真病亡。\n"
    "231年　　诸葛亮第五次北伐。\n"
    "234年　　诸葛亮六出祁山。\n"
    "　　8月　诸葛亮病逝于五丈原。\n"
    "　　　　　吴大举攻魏合肥。\n"
    "235年1月　曹睿封司马懿为太傅。\n"
    "　　　　　马钧制造司南车和水转百戏。\n"
    "237年　　辽东公孙渊自立为燕王。\n"
    "238年　　司马懿平辽东，杀公孙渊。\n"
    "　　　　　日本邪马台女王卑弥呼派使者到魏，魏封卑弥呼为“亲魏倭王”。\n"
    "239年1月　曹睿亡，曹芳继位。\n"
    "240年　　蜀将张嶷平定蛮族之乱。\n"
    "241年　　魏国在淮河兴修水利。\n"
    "242年　　孙权派军攻打海南岛。\n"
    "244年　　曹爽派兵攻打蜀汉不利，伤亡惨重。\n"
    "245年　　吴太子孙和与鲁王孙霸争权，陆逊因受牵连，忧愤而死。\n"
    "246年　　毌丘俭两度攻破高句丽。\n"
    "247年　　蜀姜维出陇右攻魏，接应附蜀的羌、胡部落。\n"
    "248年　　司马懿封为丞相。\n"
    "249年1月　司马懿杀曹爽一伙。\n"
    "　　　　　夏侯霸降蜀。姜维伐魏。\n"
    "250年　　孙权废太子孙和为庶人，赐鲁王孙霸死，立孙亮为太子。\n"
    "\n"
    "姜维攻魏西平失败。\n"
    "251年　　魏国太尉王凌阴谋叛变，被司马懿平定。\n"
    "　　7月　司马懿亡。\n"
    "252年　　司马懿长子司马师为大将军。\n"
    "　　　　　孙权亡，孙亮继位。\n"
    "　　　　　司马昭攻吴，失败。\n"
    "253年　　诸葛恪进攻魏国，无功而返。\n"
    "　　　　　姜维攻魏狄道失败。\n"
    "　　　　　吴孙峻诛杀诸葛恪。\n"
    "254年9月　司马师废曹芳。\n"
    "　　10月　曹髦继位。\n"
    "　　　　　吴孙英谋杀孙峻未果。\n"
    "255年　　镇东将军毌丘俭与扬州刺史文钦讨伐司马师。\n"
    "　　　　　司马师亡。司马昭为大将军。\n"
    "　　　　　姜维攻魏狄道，先胜后败。\n"
    "256年4月　司马昭讨伐诸葛诞。\n"
    "　　　　　姜维伐魏被邓艾击败。\n"
    "　　　　　吴孙峻死，弟孙琳专吴政。孙綝杀死滕胤等人。\n"
    "257年　　魏诸葛诞与孙吴联合起兵反魏。\n"
    "　　　　　姜维出骆谷攻魏失败。\n"
    "258年　　魏军攻破寿春，斩诸葛诞。\n"
    "　　　　　孙綝废吴帝孙亮为会稽王，立琅琊王孙休为帝。\n"
    "　　　　　孙休与丁奉设计杀死孙綝。\n"
    "260年5月　贾充、成济杀死曹髦。\n"
    "　　6月　曹奂继位。\n"
    "262年10月姜维攻魏，被邓艾击败，退屯沓中。\n"
    "263年　　司马昭三路伐蜀，蜀亡。\n"
    "264年　　钟会和姜维密谋失败被杀。\n"
    "　　　　　司马昭称晋王。\n"
    "　　　　　孙休亡，孙皓继位。\n"
    "265年　　司马昭亡，其子司马炎继任晋王。\n"
    "　　12月司马炎废曹奂为陈留王，自称晋武帝，建立西晋，魏亡。\n"
    "271年　　吴孙皓出兵攻晋，因士兵怨恨而止。\n"
    "272年　　司马炎派杨肇、羊祜等率军支持战略要地西陵。\n"
    "　　　　　陆抗大败杨肇，杀步阐。\n"
    "277年　　晋文鸯击破鲜卑族。\n"
    "278年　　羊祜死、杜预驻扎襄阳。\n"
    "279年　　西晋出动六路兵马攻打吴国。\n"
    "280年　　西晋消灭吴国，吴帝孙皓投降，吴亡\n"
    "\n"
    "三国战争年表\n"
    "\n"
    "190年关东诸侯讨董卓之战\n"
    "　　　曹操攻董卓荥阳之战\n"
    "　　　孙坚鲁阳退敌\n"
    "　　　董卓袭王匡河阳津之战\n"
    "　　　孙坚斩华雄阳人之战\n"
    "　　　刘表平定荆州之战\n"
    "191年孙坚攻董卓洛阳诸陵之战\n"
    "　　　袁绍袭孙坚阳城之战\n"
    "　　　孙坚击刘表襄阳之战\n"
    "　　　曹操击黑山军濮阳之战\n"
    "　　　陶谦破黄巾军徐州之战\n"
    "　　　刘焉割据益州之战\n"
    "　　　公孙瓒破黄巾军东光之战\n"
    "192年袁绍与公孙瓒界桥之战\n"
    "　　　公孙瓒击袁绍巨马水之战\n"
    "　　　公孙瓒攻袁绍龙凑之战\n"
    "　　　袁术击袁遗扬州之战\n"
    "　　　李傕等进犯长安之战\n"
    "　　　曹操击黑山军武阳之战\n"
    "　　　曹操破黄巾军兖州之战\n"
    "193年曹操击袁术封丘之战\n"
    "　　　曹操攻陶谦彭城之战\n"
    "　　　公孙瓒灭刘虞幽州之战\n"
    "　　　袁谭攻田楷青州之战\n"
    "　　　袁绍攻黑山军常山之战\n"
    "194年吴景攻周昕丹阳之战\n"
    "　　　孙策攻陆康庐江之战\n"
    "195年孙策攻刘繇曲阿之战\n"
    "　　　孙策与太史慈神亭之战\n"
    "　　　刘繇攻诸葛玄、笮融豫章之战\n"
    "　　　李傕劫持帝后公卿长安之战\n"
    "　　　李傕、郭汜攻杨奉、董承弘农之战\n"
    "　　　袁绍攻臧洪东郡之战\n"
    "　　　鲜于辅攻公孙瓒鲍丘之战\n"
    "　　　曹操攻吕布定陶之战\n"
    "196年吕布袭刘备下邳之战\n"
    "　　　郝萌袭吕布徐州之战\n"
    "　　　孙策攻王朗会稽之战\n"
    "　　　曹操攻杨奉梁县之战\n"
    "　　　曹操灭何义黄巾军之战\n"
    "197年曹操攻张绣淯水之战\n"
    "　　　曹操攻袁术蕲阳之战\n"
    "　　　曹操攻张绣湖阳之战\n"
    "　　　吕范、徐逸攻陈瑀海西之战\n"
    "　　　吕布破袁术下邳之战\n"
    "　　　袁术灭陈王刘宠淮阳之战\n"
    "　　　吕布攻臧霸莒城之战\n"
    "198年袁绍灭公孙瓒易京之战\n"
    "　　　段煨灭李傕关中之战\n"
    "　　　曹操攻张绣穰城之战\n"
    "　　　曹操灭吕布下邳之战\n"
    "199年曹操灭眭固射犬之战\n"
    "　　　刘岱攻刘备小沛之战\n"
    "　　　孙策袭刘勋皖城之战\n"
    "　　　孙策攻黄祖沙羡之战\n"
    "　　　孙策平邹佗、严白虎之战\n"
    "200年策攻陈登丹徒遇害之战\n"
    "　　　刘表破张怿长沙之战\n"
    "　　　刘馥平定扬州之战\n"
    "　　　张鲁据汉中之战\n"
    "　　　刘璋平赵韪益州之战\n"
    "　　　孙权灭李术皖城之战\n"
    "　　　曹操破刘备徐州之战\n"
    "　　　曹操斩颜良白马之战\n"
    "　　　曹仁攻刘备汝、颍之战\n"
    "　　　蔡阳攻刘备汝南之战\n"
    "　　　曹操夜袭乌巢之战\n"
    "201年曹操破袁绍仓亭之战\n"
    "202年锺繇击郭援平阳之战\n"
    "203年贺齐平建安之战\n"
    "　　　袁谭与袁尚之战\n"
    "　　　曹操攻袁谭袁尚黎阳、邺城之战\n"
    "204年曹操攻袁尚邺城之战\n"
    "　　　曹操灭袁谭南皮之战\n"
    "　　　孙权平妫览戴员丹阳之战\n"
    "　　　孙权平山越之战\n"
    "205年杜畿灭卫固定河东之战\n"
    "　　　曹操平定幽州之战\n"
    "　　　曹操灭高斡壶关之战\n"
    "206年乐进李典破管承长广之战\n"
    "　　　于禁平昌豨东海之战\n"
    "　　　雍州兵讨张猛之战\n"
    "207年孙权攻黄祖江夏之战\n"
    "　　　曹操攻乌桓白狼山之战\n"
    "208年孙权灭黄祖夏口之战\n"
    "　　　曹操灭刘表襄阳之战\n"
    "　　　曹操破刘备当阳之战\n"
    "　　　赤壁之战\n"
    "209年周瑜攻曹仁江陵之战\n"
    "　　　孙权围攻合肥之战\n"
    "　　　张昭攻当涂之战\n"
    "　　　贺齐攻陈仆黟、歙之战\n"
    "　　　张辽平陈兰、梅成六安之战\n"
    "210年步骘灭吴巨交州之战\n"
    "211年曹操破马超渭南之战\n"
    "　　　刘备灭刘璋取益州之战\n"
    "212年曹丕攻田银苏伯之战\n"
    "213年曹操攻孙权濡须口之战\n"
    "　　　马超攻韦康冀城之战\n"
    "214年夏侯渊攻马超祁山之战\n"
    "　　　诸葛亮入川之战\n"
    "　　　夏侯渊灭宋建陇右之战\n"
    "　　　孙权攻占皖城之战\n"
    "　　　夏侯渊攻韩遂长离之战\n"
    "　　　霍峻守葭萌城之战\n"
    "215年曹操破窦茂灭韩遂河池之战\n"
    "　　　张飞攻张郃巴西之战\n"
    "　　　赵俨平吕并陈仓之战\n"
    "　　　曹操攻张鲁阳平之战\n"
    "　　　孙权围合肥之战\n"
    "217年陆逊击费栈丹阳之战\n"
    "\n"
    "孙权与曹操第二次濡须口之战\n"
    "218年王必平耿纪许昌之战\n"
    "　　　曹洪破吴兰下辨之战\n"
    "　　　曹彰击乌桓代郡之战\n"
    "　　　曹仁破侯音宛城之战\n"
    "　　　李严平定马秦、高定之战\n"
    "　　　刘备攻取汉中之战\n"
    "219年刘封、孟达攻申耽上庸之战\n"
    "　　　樊城之战\n"
    "　　　吕蒙袭关羽江陵之战\n"
    "\n"
    "220年孟达攻刘封上庸之战\n"
    "　　　苏则平定河西之乱\n"
    "221年张既平定河西之战\n"
    "222年夷陵之战\n"
    "杨洪平黄元叛蜀之战\n"
    "　　　曹丕首征东吴之战\n"
    "　　　曹休与吕范洞口之战\n"
    "223年曹仁与朱恒濡须口之战\n"
    "　　　张郃攻占江陵中洲之战\n"
    "　　　曹真与朱然江陵之战\n"
    "　　　贺齐取蕲春之战\n"
    "224年田豫击鲜卑轲比能之战\n"
    "　　　曹丕攻广陵之战\n"
    "225年任福平蔡方、唐咨之战\n"
    "　　　诸葛亮平南中之战\n"
    "　　　周鲂攻彭绮鄱阳之战\n"
    "226年泪饭交趾之战\n"
    "　　　孙权攻魏之战\n"
    "　　　诸葛瑾攻襄阳之战\n"
    "227年张嶷平张慕之战\n"
    "228年曹真破赵云之战\n"
    "　　　孟达反魏之战\n"
    "　　　诸葛亮攻魏街亭之战\n"
    "229年葛亮攻魏陈仓之战\n"
    "　　　诸葛亮攻魏武都、阴平之战\n"
    "　　　魏与吴石亭之战\n"
    "230年曹真攻蜀汉中之战\n"
    "　　　潘浚、吕岱平武陵蛮之战\n"
    "　　　满宠守合肥之战\n"
    "231年布袭王凌阜陵之战\n"
    "　　　诸葛亮攻魏上邽之战\n"
    "232年魏与吴成山之战\n"
    "　　　魏与吴庐江之战\n"
    "　　　魏攻公孙渊辽东之战\n"
    "233年马忠平南夷之战\n"
    "　　　魏击鲜卑楼烦之战\n"
    "　　　吴攻魏合肥新城之战\n"
    "234年诸葛亮攻魏五丈原之战\n"
    "　　　杨仪杀魏延之战\n"
    "　　　诸葛恪平山越\n"
    "　　　吕岱平李桓、罗厉庐陵之战\n"
    "237年陆逊平彭旦鄱阳之战\n"
    "　　　毋丘俭攻公孙渊辽东之战\n"
    "　　　陆逊平吴遽豫章、庐陵之战\n"
    "\n"
    "238年司马懿平公孙渊辽东之战\n"
    "239年羊衠袭辽东之战\n"
    "　　　吕岱平廖式交州之战\n"
    "240年张嶷平越隽之战\n"
    "241年吴攻魏芍陂、樊城之战\n"
    "243年吴袭六安之战\n"
    "244年曹爽攻蜀汉中之战\n"
    "246年吴攻魏柤中之战\n"
    "　　　毋丘俭攻高句丽之战\n"
    "246年姜维平汶山夷之战\n"
    "247年姜维攻魏洮西之战\n"
    "248年邓芝攻涪陵夷之战\n"
    "　　　陆胤平交趾、九真夷之战\n"
    "249年姜维攻曲城之战\n"
    "　　　姜维攻西平之战\n"
    "250年魏与吴江陵之战\n"
    "　　　吴败文钦之战\n"
    "251年王基、州泰击吴之战\n"
    "252年魏与吴东兴之战\n"
    "253年吴、蜀攻魏南安、合肥之战\n"
    "254年姜维攻临洮、陇西之战\n"
    "255年司马师平毋丘俭、文钦之战\n"
    "　　　孙峻攻寿春之战\n"
    "　　　姜维攻狄道之战\n"
    "256年文钦、吕据攻魏之战\n"
    "　　　姜维攻段谷之战\n"
    "257年姜维攻芒水之战\n"
    "　　　司马昭破诸葛诞寿春之战\n"
    "　　　魏平高显县民之战\n"
    "　　　吴平三郡起义之战\n"
    "260年成济杀魏曹髦之战\n"
    "262年姜维攻邓艾洮阳之战\n"
    "263年曹魏灭蜀之战\n"
    "　　　吴平吕兴交趾之战\n"
    "　　　钟离牧平武陵之战\n"
    "264年罗宪抗吴永安之战\n"
    "　　　王稚攻吴句章之战\n"
    "　　　钟会、姜维反魏成都之战\n"
    "266年堂施起义军之战\n"
    "268年吴攻江夏之战\n"
    "　　　杨稷破刘俊交州之战\n"
    "　　　晋与吴合肥之战\n"
    "270年晋攻鲜卑万斛堆之战\n"
    "　　　吴晋涡口之战\n"
    "271年青山之战\n"
    "　　　吴攻晋交趾等郡之战\n"
    "　　　匈奴刘猛攻并州之战\n"
    "272年晋攻匈奴刘猛之战\n"
    "　　　陆抗平西陵之战\n"
    "　　　王睿平定张弘之战\n"
    "　　　杨欣讨宋质之战\n"
    "273年吴晋戈阳之战\n"
    "274年吴镇压奚熙之乱\n"
    "　　　晋反击凉州胡之战\n"
    "　　　晋攻吴枳里之战\n"
    "　　　吴攻晋江夏之战\n"
    "275年晋攻鲜卑之战\n"
    "276年胡奋击并州胡之战\n"
    "　　　晋攻鲜卑之战\n"
    "　　　鲜卑攻晋边之战\n"
    "　　　杨欣讨令狐宏之战\n"
    "277年文鸯破鲜卑之战\n"
    "　　　吴晋江夏之战\n"
    "278年晋与鲜卑武威之战\n"
    "　　　晋吴皖城之战\n"
    "　　　晋吴西陵之战\n"
    "279年吴攻郭马之战\n"
    "　　　马隆收复凉州之战\n"
    "280年晋灭吴之战\n";
        //设置它显示的内容
    
    self.textView.returnKeyType = UIReturnKeyDefault;//返回键的类型
    
    self.textView.keyboardType = UIKeyboardTypeDefault;//键盘类型
    
    self.textView.scrollEnabled = YES;//是否可以拖动
    [self.textView setEditable:NO];
    
    
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    
    
    
    [self.view addSubview: self.textView];//加入到整个页面中
    CGRect rect = [ UIScreen mainScreen ].applicationFrame;
    CGSize size = rect.size;
 //   CGFloat width = size.width;
 //   CGFloat height = size.height;
    int heightFour = size.height;
    if (heightFour>480) {
       
        CGRect frame = bt.frame;
        frame.origin.y = 517;
        bt.frame = frame;
    }
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) backGame{
  //  DeviceViewController *gameView = [[DeviceViewController alloc]init];
   // [self removeFromParentViewController];
  //  [self presentModalViewController:gameView animated:YES];
    [self dismissModalViewControllerAnimated:YES];
}

@end
