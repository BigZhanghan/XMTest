<br>OC考试系统，从服务器获取考试题，提交考试服务器返回成绩。<br/>
<br>目前服务已经停了，无法请求到考试题数据。请自行捏造数据到本地文件，从本地加载考卷。2018-01-24<br/>

//getSourceData方法加载考卷（注释从服务端获取，改为从本地加载）<br/>
//加载本地json（test_data.json为本地考题样例文件）<br/>

    NSString *path = [[NSBundle mainBundle] pathForResource:@"test_data.json" ofType:nil];<br/>
    NSData *data = [NSData dataWithContentsOfFile:path];<br/>
    NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];<br/>
    self.examsM = [ExamsModel mj_objectWithKeyValues:resultDict];<br/>

<br>[开始考试]<br/><br><img src="https://github.com/BigZhanghan/XMTest/blob/master/XMTest/ScreenShoot/IMG_0552.PNG" width = "375" height = "667" /><br/>
<br>[题1]<br/><br><img src="https://github.com/BigZhanghan/XMTest/blob/master/XMTest/ScreenShoot/IMG_0555.PNG" width = "375" height = "667" /><br/>
<br>[题2]<br/><br><img src="https://github.com/BigZhanghan/XMTest/blob/master/XMTest/ScreenShoot/IMG_E0554.JPG" width = "375" height = "667" /><br/>
<br>[答题卡]<br/><br><img src="https://github.com/BigZhanghan/XMTest/blob/master/XMTest/ScreenShoot/IMG_0553.PNG" width = "375" height = "667" /><br/>
