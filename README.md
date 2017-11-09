# CYRuler
标尺升级版 (scrollRulerView upgrade)

![image](https://github.com/clarkIsMe/image/blob/master/rulergif.gif)

##### create an ruler that horizontal and up
<pre><code>
CYRuler *ruler = [CYRuler horizontalUpRulerWithFrame:CGRectMake(10, 300, 300, 80)];
[self.view addSubview:ruler];
ruler.rulerDelegate = self;
[ruler rulerWithPointerOffset:100.0f startScale:10 endScale:1000 valueOfUnitScale:10 defaultScale:20];
</code></pre>

##### create an ruler that horizontal and down
<pre><code>
CYRuler *ruler = [CYRuler horizontalDownRulerWithFrame:CGRectMake(10, 100, 300, 80)];
[self.view addSubview:ruler];
ruler.rulerDelegate = self;
[ruler rulerWithPointerOffset:100.0f startScale:10 endScale:1000 valueOfUnitScale:10 defaultScale:20];
</code></pre>

##### custom attribute
<pre><code>
ruler.scaleNumberFont = [UIFont systemFontOfSize:8];
ruler.scaleNumberColor = [UIColor whiteColor];
ruler.scaleLineColor = [UIColor whiteColor];
ruler.scaleLineWidth = 0.5;
</code></pre>

##### reset the ruler
<pre><code>
[ruler rulerResetPointerOffset:150 startScale:30 endScale:1000 valueOfUnitScale:10 defaultScale:50];
</code></pre>

##### custom pointer
<pre><code>
UIView *pointer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
pointer.backgroundColor = [UIColor whiteColor];
ruler.pointer = pointer;   //can not be nil
</code></pre>

##### custom text display box
<pre><code>
UILabel *scaleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
scaleLable.backgroundColor = [UIColor blueColor];
scaleLable.textAlignment = NSTextAlignmentCenter;
ruler.scaleLable = scaleLable;  //can be nil
</code></pre>

### how to use
<pre><code>
pod 'CYRuler'

#import <CYRuler.h> 
</code></pre>
