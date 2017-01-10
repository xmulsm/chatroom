var myconstant = (function() {

  var ActivityPropState = {
    NORMAL:0, // 正常
    ARCHIVED:1, // 已归档
    DELETED:2 // 已删除
  };

  var ActivityState = {
    PREPARE:0, // 未开始
    ONGOING:1, // 进行中
    ENDED:2 // 已结束
  };

  var ActivityState_desc = {
    '0':'未开始',
    '1':'进行中',
    '2':'已结束'
  };

  var AliyunPath = {
    TEST:"test", // 测试
    QUESTION_IMG:"question/image", // 题目图片
    QUESTION_MEDIA:"question/media", // 题目多媒体
    QUESTION_FILE:"question/file", // 题目文件
    MONITOR_IMG:"monitor/image", // 监控图片
    COMPANY_LOGO:"company/logo", // 公司logo
    USER_IMG:"user/image", // 用户图片
    USER_MEDIA:"user/media", // 用户多媒体
    USER_FILE:"user/file", // 用户文件
    CLAZZ_IMG:"user/clazz/image" // 班级图片
  };

  var AnswerCommitType = {
    COMMIT_ANSWER_TIME_BOTH:0, // 答案时间一起提交
    COMMIT_TIME_ONLY:1, // 只提交时间
    COMMIT_ANSWER_ONLY:2 // 只提交答案
  };

  var AnswerCommitType_desc = {
    '0':'答案时间一起提交',
    '1':'只提交时间',
    '2':'只提交答案'
  };

  var AnswerStyle = {
    ORDERED:1, // 完全一致
    DISORDERABLE:2, // 仅顺序不一致
    UNCOMPARABLE:3 // 仅供参考
  };

  var AnswerStyle_desc = {
    '1':'完全一致',
    '2':'仅顺序不一致',
    '3':'仅供参考'
  };

  var AttachmentType = {
    VIDEO:1, // 视频
    AUDIO:2, // 音频
    FILE:3 // 普通文件
  };

  var AttachmentType_desc = {
    '1':'视频',
    '2':'音频',
    '3':'普通文件'
  };

  var AuditState = {
    PENDING:0, // 待审核
    ACCEPTED:1, // 审核通过
    REJECTED:2, // 审核拒绝
    INVALID:3 // 停用
  };

  var Authority = {
    ROLE_USER:"ROLE_USER", // 用户
    ROLE_CLIENT:"ROLE_CLIENT", // 客户
    ROLE_COMPANY:"ROLE_COMPANY", // 企业管理员
    ROLE_ADMIN:"ROLE_ADMIN", // 管理员
    ROLE_DEMO:"ROLE_DEMO" // 体验帐号
  };

  var Authority_desc = {
    'ROLE_USER':'用户',
    'ROLE_CLIENT':'客户',
    'ROLE_COMPANY':'企业管理员',
    'ROLE_ADMIN':'管理员',
    'ROLE_DEMO':'体验帐号'
  };

  var AuthorizedType = {
    USER:1, // 用户
    COMPANY:2 // 公司
  };

  var BankInfoFlags = {
    SUMMARY:1, // 题库
    STAT:2, // 统计
    SAMPLE:4 // 样例
  };

  var BasicType = {
    INT:1, // int
    DOUBLE:2, // double
    STRING:3 // String
  };

  var BasicType_desc = {
    '1':'int',
    '2':'double',
    '3':'String'
  };

  var BindType = {
    WEIBO:1, // 微博
    QQ:2, // QQ
    WEIXIN:3, // 微信
    WEIXIN_MP:4, // 微信公众平台
    DINGDING:5, // 钉钉
    MINGDAO:6 // 明道
  };

  var CatalogOrder = {
    SORT_BY_TIME:0, // 按时间排序
    ALPHABETICAL:1 // 按字母顺序
  };

  var CatalogOrder_desc = {
    '0':'按时间排序',
    '1':'按字母顺序'
  };

  var ChargeType = {
    CASH:1, // 现金
    REWARD:2, // 奖励
    WITH_DRAWAL:4 // 提现
  };

  var ClazzFeatures = {
    VIP_ENABLED:8 // vip群
  };

  var ClazzInfoFlags = {
    CLAZZ_BASE:1, // 只获取班级
    CLAZZ_USER_TYPE:32, // 用户在班级的角色
    CLAZZ_UNREAD_REPORTS:64, // 管理员未读报告数
    CLAZZ_UNTEST_PAPERS:128, // 成员未答作业数
    CLAZZ_RESENT_TIMES:256, // 成员催促次数
    CLAZZ_NOTICES:512 // 群公告
  };

  var ClazzInfoFlags_desc = {
    '1':'只获取班级',
    '32':'用户在班级的角色',
    '64':'管理员未读报告数',
    '128':'成员未答作业数',
    '256':'成员催促次数',
    '512':'群公告'
  };

  var ClazzMemberType = {
    ALL:0, // 所有
    EXAMINER:1, // 管理员
    EXAMINEE:2, // 学员
    INVITED:4, // 已邀请
    ClAZZ_CREATER:8, // 群主
    EXAMINEE_INVITED:6, // 学员和已邀请
    EXCLUDE_CREATER:7 // 排除群主
  };

  var ClazzMemberType_desc = {
    '0':'所有',
    '1':'管理员',
    '2':'学员',
    '4':'已邀请',
    '8':'群主',
    '6':'学员和已邀请',
    '7':'排除群主'
  };

  var ClazzPerm = {
    ALLOW_ALL:1, // 允许任何人
    NEED_PERMIT:2, // 需要身份验证
    NOT_ALLOW_ANY:4 // 不允许任何人
  };

  var ClazzPerm_desc = {
    '1':'允许任何人',
    '2':'需要身份验证',
    '4':'不允许任何人'
  };

  var ClazzUserPerm = {
    RESET_PASSWORD:1 // 重置密码
  };

  var ClazzUserState = {
    PENDING:1, // 申请中
    ACCESS:2, // 通过
    DENY:3, // 拒绝
    OUT_BY_TEACHER:4, // 被管理员退出
    OUT_BY_SELF:5 // 自己退出
  };

  var ClazzUserState_desc = {
    '1':'申请中',
    '2':'通过',
    '3':'拒绝',
    '4':'被管理员退出',
    '5':'自己退出'
  };

  var ClazzUserType = {
    EXAMINER:1, // 管理员
    EXAMINEE:2 // 学员
  };

  var ClazzUserType_desc = {
    '1':'管理员',
    '2':'学员'
  };

  var CodeType = {
    BIND_ACCOUNT:1, // 帐号绑定
    PASSWORD_FOUND:2 // 密码找回
  };

  var CombinationType = {
    NORMAL:0, // 普通题
    PARENT:1, // 父题目
    CHILD:2 // 子题目
  };

  var CompanyEmployerState = {
    PENDING_USER:1, // 待用户确认
    PENDING_MANAGER:2, // 待管理员审核
    ACCESS:4, // 已加入
    DENY:8 // 拒绝
  };

  var CompanyEmployerState_desc = {
    '1':'待用户确认',
    '2':'待管理员审核',
    '4':'已加入',
    '8':'拒绝'
  };

  var CompanyPerm = {
    TEACHER_REGISTER:1, // 允许老师注册
    TEACHER_REVIEW:2, // 老师注册需要审核
    STUDENT_REGISTER:4, // 允许学生注册
    ALLOW_SWITCH:8, // 允许学生切换
    USERNAME_REGISTER:16, // 登录名注册
    EMAIL_REGISTER:32, // 邮箱注册
    PHONE_REGISTER:64, // 手机号注册
    LOGIN_WEIXIN:128, // 微信登录
    LOGIN_WEIBO:256, // 微博登录
    LOGIN_QQ:512, // QQ登录
    LOGIN_DINGDING:1024, // 钉钉登录
    LOGIN_MINGDAO:2048 // 明道登录
  };

  var CompanyState = {
    NEW:0, // 新申请
    VIP:1, // 认证企业
    CLOSED:-1 // 关闭
  };

  var CompanyTemplateId = {
    INVITATION:"invitation" // 邀请
  };

  var ConfigInfoFlags = {
    UNSCORE_FINISHED:1, // 非立即出成绩
    SCORE_FINISHED:2, // 立即出成绩
    ALL:3 // 所有
  };

  var ConfigSaleState = {
    PENDING:1, // 待审核
    PUBLISHED:2, // 已发布
    CANCELLED:4 // 已下架
  };

  var ConfigSaleState_desc = {
    '1':'待审核',
    '2':'已发布',
    '4':'已下架'
  };

  var CourseInfoFlags = {
    SUMMARY:1 // 课件
  };

  var CourseType = {
    MEDIA:1 // 视频
  };

  var CourseType_desc = {
    '1':'视频'
  };

  var DataType = {
    STRING:1, // 字符串
    INTEGER:2, // 整形
    DATE:3, // 日期型
    MONEY:4 // 货币型
  };

  var DemoPaperDevice = {
    CAMERA_NONE:0, // 无摄像头
    CAMERA:1 // 有摄像头
  };

  var DemoPaperDevice_desc = {
    '0':'无摄像头',
    '1':'有摄像头'
  };

  var DeviceType = {
    MICROPHONE:1, // 麦克风
    CAMERA:2, // 摄像头
    PROGRAM:4, // 编程题
    FILEALLOWED:8 // 上传附件
  };

  var DevType = {
    M:"m" // 手机端
  };

  var Difficulty = {
    EASY:2, // 易
    MODERATE:3, // 中
    DIFFICULT:4 // 难
  };

  var Difficulty_desc = {
    '2':'易',
    '3':'中',
    '4':'难'
  };

  var DocDescType = {
    TYPE_FIELD:0, // 字段
    TYPE_CONSTRUCTOR:1, // 构造方法
    TYPE_METHOD:2 // 方法
  };

  var EmailErrorCode_desc = {
    '0':'成功',
    '1':'未知错误',
    '101':'域名不存在',
    '102':'邮件服务器错误',
    '103':'反垃圾设置拒收',
    '42101':'该IP发送行为异常',
    '42102':'该IP同时并发连接数过大',
    '42103':'该IP短期内发送了大量信件',
    '42104':'该IP发送行为异常',
    '45001':'发送方出现过多的错误指令',
    '45002':'当前连接发送的邮件数量超出限制',
    '45003':'发送方发送超出正常的指令数量',
    '45004':'当前连接发送的收件人数量超出限制',
    '45005':'发送方发送超出正常的指令数量',
    '45006':'发信IP位于一个或多个RBL里',
    '45007':'该IP不在网易允许的发送地址列表里',
    '45008':'此用户不在网易允许的发信用户列表里',
    '45101':'被临时拒收，请重试',
    '45102':'登录失败次数过多',
    '45103':'发送方出现过多的错误指令',
    '45104':'当前连接发送的邮件数量超出限制',
    '45105':'发信人在15分钟内的发信数量超过限制',
    '45106':'发信方短期内累计的收件人数量超过限制',
    '45107':'系统暂时出现故障',
    '50001':'发送的smtp命令语法有误',
    '50002':'HELO命令不允许为空',
    '50003':'发信人电子邮件地址不合规范',
    '50004':'发信IP未被发送域的SPF许可',
    '50005':'该邮件未被发信域的DMARC许可',
    '50006':'发件人当天的连接数量超出了限定数量',
    '50007':'网易邮箱不开放匿名转发',
    '50008':'群发收件人数量超过了限额',
    '50009':'发件人当天内累计的收件人数量超过限制',
    '50010':'邮件正文带有很多垃圾邮件特征或发送环境缺乏规范性',
    '50011':'请求的用户不存在',
    '50012':'该用户不被允许给网易用户发信',
    '50013':'请求的用户处于禁用或者冻结状态',
    '50014':'群发数量超过了限额',
    '53501':'邮箱用户名、密码错误',
    '53502':'该填写用户名、密码而没有填写',
    '55201':'不允许发送该类型的附件',
    '55202':'发送的信件大小超过了允许接收的最大限制',
    '55301':'不允许发件人为空',
    '55302':'SMTP类型的机器只允许发信人是本站用户',
    '55303':'MX类型的机器不允许发信人是本站用户',
    '55304':'SMTP需要身份验证',
    '55401':'发送的邮件内容包含了未被许可的信息',
    '55402':'信封发件人和信头发件人不匹配',
    '55403':'该IP验证失败次数过多，被临时禁止连接',
    '55404':'发信IP因发送垃圾邮件或存在异常的连接行为',
    '55405':'该IP不在网易允许的发送地址列表里',
    '55406':'发件人当天内累计邮件数量超过限制',
    '55407':'此用户不在允许的发信用户列表里',
    '55408':'该IP不在允许的发送地址列表里'
  };

  var EmailState = {
    READY:0, // 待发送
    SENT:1, // 发送成功
    FAILURE:2 // 发送失败
  };

  var EmailType = {
    TEXT:0, // 文本
    HTML:1 // HTML
  };

  var EmployerState = {
    VALID:1, // 正常
    EMAIL_VALIDATED:2, // 邮箱已验证
    PHONE_VALIDATED:4 // 手机号已验证
  };

  var EmployerType = {
    EXAMINER:1, // 考官/老师
    EXAMINEE:2 // 考生/学员
  };

  var EmployerType_desc = {
    '1':'考官/老师',
    '2':'考生/学员'
  };

  var ErrorCode = {
    SUCCESS:0, // 成功
    EINVAL:1, // 参数无效
    ETIME:2, // 超时
    EREGISTER:3, // 注册失败
    EUSER:4, // 未登录
    ELOGIN:5, // 登录错误
    EPERM:6, // 权限错误
    EBUSI:7, // 业务错误
    ESYSTEM:8, // 系统错误
    ELOCK:9, // 禁用
    EDENY:11, // 账号拒绝
    EPENDING:12, // 账号申请中
    TEST_MAX:21 // 考试并发超过请求
  };

  var ErrorType = {
    FORMAT:0, // 格式错误
    TIME:1, // 时间错误
    SIMILARITY:2 // 相似度错误
  };

  var ExamingThreshold = {
    FORBID_RESULT:0, // 不允许查对错
    PERMIT_RESULT:6, // 可查对错
    PERMIT_ANSWER:14 // 可查答案
  };

  var ExamingThreshold_desc = {
    '0':'不允许查对错',
    '6':'可查对错',
    '14':'可查答案'
  };

  var ExamState = {
    PREPARE:0, // 未开始
    ONGOING:1, // 进行中
    ENDED:2 // 已结束
  };

  var ExamState_desc = {
    '0':'未开始',
    '1':'进行中',
    '2':'已结束'
  };

  var Features = {
    MESSAGE_ENABLED:1, // 允许短信确认
    BATCH_PDF_ENABLED:2, // 允许批量下载PDF报告
    TEST_QUOTA_ENABLED:4, // 测试数量限制
    VIP_ENABLED:8, // 付费用户
    EMPLOYER_ADVERTISE:16, // 配置广告
    COMPANY_ENABLED:32 // 企业用户
  };

  var FileType = {
    XLS:0, // Excel 2007前格式
    XLSX:1, // Excel 2007后格式
    WORD:2, // Word
    TEXT:3 // 文本
  };

  var GiftState = {
    NOT_PRESENTED:0, // 未赠送
    PRESENTED:1 // 已赠送
  };

  var GiftState_desc = {
    '0':'未赠送',
    '1':'已赠送'
  };

  var InfoId = {
    NAME:1, // name
    UID:2, // uid
    PHONE:3, // phone
    GENDER:4, // gender
    COLLEGE:5, // college
    EDUCATION:6, // education
    WORK_YEARS:7, // workYears
    RESIDENT_ADDRESS:8, // residentAddress
    WORK_INDUSTRY:9, // workIndustry
    TRAVEL_FOR_BIZ:10, // travelForBiz
    EXPECTED_SALARY:11, // expectedSalary
    POSTGRADUATE_APPLIED:12, // postgraduateApplied
    INTENTION_POSITION:13, // intentionPosition
    PORTRAIT:14, // portrait
    CARD_NO:15, // cardNo
    RESUME_ID:16, // resumeId
    TICKET_NO:17, // ticketNo
    EXPECTED_ADDRESS:18, // expectedAddress
    GRADUATION_TIME:19, // graduationTime
    APPLY_ID:20, // applyId
    MAJOR:21, // major
    APPLIED_POSITION:22, // appliedPosition
    VALIDATION_CODE:23, // validationCode
    EMPLOYEE_NO:24, // employeeNo
    DEPARTMENT:25, // department
    STUDENT_ID:26, // studentId
    ORGANIZATION_NAME:27, // organizationName
    NATIONALITY:28, // nationality
    CLAZZ:29, // clazz
    SCHOOL:30, // school
    DETAIL_ADDRESS:31, // detailAddress
    NATION:32, // nation
    CUSTOM_ID_1:80, // custom1
    CUSTOM_ID_2:81, // custom2
    CUSTOM_ID_3:82, // custom3
    CUSTOM_ID_4:83, // custom4
    CUSTOM_ID_5:84, // custom5
    CUSTOM_ID_6:85, // custom6
    CUSTOM_ID_7:86, // custom7
    CUSTOM_ID_8:87, // custom8
    CUSTOM_ID_9:88, // custom9
    CUSTOM_ID_10:89, // custom10
    CUSTOM_ID_11:90, // custom11
    CUSTOM_ID_12:91, // custom12
    CUSTOM_ID_13:92, // custom13
    CUSTOM_ID_14:93, // custom14
    CUSTOM_ID_15:94, // custom15
    CUSTOM_ID_16:95, // custom16
    CUSTOM_ID_17:96, // custom17
    CUSTOM_ID_18:97, // custom18
    CUSTOM_ID_19:98, // custom19
    CUSTOM_ID_20:99 // custom20
  };

  var InfoId_desc = {
    '1':'name',
    '2':'uid',
    '3':'phone',
    '4':'gender',
    '5':'college',
    '6':'education',
    '7':'workYears',
    '8':'residentAddress',
    '9':'workIndustry',
    '10':'travelForBiz',
    '11':'expectedSalary',
    '12':'postgraduateApplied',
    '13':'intentionPosition',
    '14':'portrait',
    '15':'cardNo',
    '16':'resumeId',
    '17':'ticketNo',
    '18':'expectedAddress',
    '19':'graduationTime',
    '20':'applyId',
    '21':'major',
    '22':'appliedPosition',
    '23':'validationCode',
    '24':'employeeNo',
    '25':'department',
    '26':'studentId',
    '27':'organizationName',
    '28':'nationality',
    '29':'clazz',
    '30':'school',
    '31':'detailAddress',
    '32':'nation',
    '80':'custom1',
    '81':'custom2',
    '82':'custom3',
    '83':'custom4',
    '84':'custom5',
    '85':'custom6',
    '86':'custom7',
    '87':'custom8',
    '88':'custom9',
    '89':'custom10',
    '90':'custom11',
    '91':'custom12',
    '92':'custom13',
    '93':'custom14',
    '94':'custom15',
    '95':'custom16',
    '96':'custom17',
    '97':'custom18',
    '98':'custom19',
    '99':'custom20'
  };

  var InfoSearchType = {
    FORBIDDEN:0, // 不可用
    EXACTLY:1, // 完全匹配
    CONTAINS:2, // 包含
    RANGE_STRING:3, // 字符串范围
    RANGE_NUMBER:4 // 数字范围
  };

  var InstanceChargeType = {
    PrePaid:"PrePaid", // 包月
    PostPaid:"PostPaid" // 按流量
  };

  var InstanceChargeType_desc = {
    'PrePaid':'包月',
    'PostPaid':'按流量'
  };

  var InterviewNotifyType = {
    INTERVIEW:1, // 面试
    NEXT:3, // 复试
    OUT:2 // 淘汰
  };

  var InterviewNotifyType_desc = {
    '1':'面试',
    '3':'复试',
    '2':'淘汰'
  };

  var InterviewState = {
    OUT:2, // 淘汰
    PASS:3 // 通过
  };

  var InterviewState_desc = {
    '2':'淘汰',
    '3':'通过'
  };

  var InvitationKey = {
    CANDIDATE_NAME:"candidateName", // 考生姓名
    COMPANY_NAME:"companyName", // 公司名称
    PAPER_INFO:"paperInfo", // 试卷信息
    EXAM_URL:"examUrl", // 考试链接
    QRCODE_URL:"qrcodeUrl", // 二维码地址
    BEGIN_DATE:"beginDate", // 开始时间
    END_DATE:"endDate" // 结束时间
  };

  var InvitationKey_desc = {
    'candidateName':'考生姓名',
    'companyName':'公司名称',
    'paperInfo':'试卷信息',
    'examUrl':'考试链接',
    'qrcodeUrl':'二维码地址',
    'beginDate':'开始时间',
    'endDate':'结束时间'
  };

  var InvitationState = {
    PENDING:0, // 待发送
    SUCCESS:1, // 发送成功
    FAILURE:2, // 发送失败
    NOOP:3 // 不发送
  };

  var InvitationState_desc = {
    '0':'待发送',
    '1':'发送成功',
    '2':'发送失败',
    '3':'不发送'
  };

  var LoginType = {
    SELF:1, // 百一测评
    COMPANY:2, // 普通企业
    COMPANY_SSO:3 // SSO企业
  };

  var LogType = {
    REPORT_DELETE:1 // 删除报告
  };

  var MBTISkill = {
    EI:"5000000001324", // EI/外倾内倾
    SN:"5000000001325", // SN/感觉直觉
    TF:"5000000001326", // TF/思维情感
    JP:"5000000001327" // JP/判断知觉
  };

  var MBTISkill_desc = {
    '5000000001324':'EI/外倾内倾',
    '5000000001325':'SN/感觉直觉',
    '5000000001326':'TF/思维情感',
    '5000000001327':'JP/判断知觉'
  };

  var NotificationType = {
    NOOP:0, // 不通知
    EMAIL:1, // 邮件通知
    WEIXIN:2 // 微信通知
  };

  var NotifyType = {
    SYSTEM:0, // 系统消息
    INVITATION:1, // 发送邀请消息
    SHARE:2, // 分享消息
    LINK:3, // 链接消息
    HTML:4 // HTML
  };

  var PageType = {
    HOME:1, // 首页
    STORE:2, // 商店
    HELP:3, // 服务说明
    PAPER:4, // 我的试卷
    BANK:6, // 我的题库
    CLASS:7, // 我的班级
    COURSE:8, // 我的课件
    EMPLOYEE:9, // 考生入口
    COMPANY_SETTING:11, // 设置
    COMPANY_USER:12, // 人员管理
    COMPANY_CLAZZ:13, // 班级管理
    COMPANY_PUBLISH:14, // 发布管理
    STORE_101TEST:15 // 百一商店
  };

  var PaperInfoFlags = {
    SUMMARY:1, // 试卷
    PART:2, // 部分
    QUESTION_SUMMARY:4, // 题目ID
    QUESTION_ANSWER:8, // 题目答案
    QUESTION_DETAIL:16, // 题目详情
    STAT:32, // 统计信息
    QUESTION_STAT:64, // 题目统计信息
    QUESTION_QB_BASE:128 // 题目题库信息
  };

  var ParamType = {
    SEARCH_SCORE:1, // 允许测试人查成绩
    COPYABLE:2, // 允许拷贝粘贴
    THRESHOLD:3, // 通知分数阀值
    REDIRECT_URL:4, // 考试结束后重定向
    ENABLE_CALCULATOR:5, // 显示计算器
    ENABLE_WEIXIN:11, // 启动移动端
    MONITOR:12, // 启用监控
    SWITCHES:13, // 限制切换次数
    PAUSEABLE:14, // 允许作答暂停
    IP_RESTRICTION:15 // IP限制
  };

  var PartFlag = {
    QUESTION_REORDER:1, // 题目乱序
    TYPE_MERGE:2, // 题型合并
    SKILL_MERGE:4, // 技能合并
    TYPE_REORDER:8, // 题型乱序
    SKILL_REORDER:16, // 技能乱序
    CHOICE_REORDER:32, // 选项乱序
    SKILL_PRIOR:64, // 技能优先
    BACKWARD:128, // 可回溯
    QUESTION_REPLACE:256, // 智能换题
    SKILL_SHOW:512, // 显示技能
    MC_TO_CHOOSE_LESS:1024, // 少选给分
    IGNORE_SKILL_MATCHE:4096, // 忽略技能一致
    IGNORE_DIFFICULTY_MATCHE:8192 // 忽略困难一致
  };

  var PayState = {
    SUCCESS:0, // 成功
    FAIL:1 // 失败
  };

  var PayState_desc = {
    '0':'成功',
    '1':'失败'
  };

  var PayType = {
    WEIXIN:1, // 微信支付
    ALIPAY:2, // 支付宝支付
    ACCOUNT:3 // 账号支付
  };

  var PayType_desc = {
    '1':'微信支付',
    '2':'支付宝支付',
    '3':'账号支付'
  };

  var ProgramLanguage = {
    OTHER:0, // Other
    JAVA:1, // Java
    C:2, // C
    CPP:3, // C++
    OBJECTIVE_C:4, // ObjectiveC
    PYTHON:5, // Python
    SHELL:6, // Shell
    JAVASCRIPT:7, // JavaScript
    PHP:8, // PHP
    PERL:9, // Perl
    RUBY:10, // Ruby
    C_SHARP:11, // C#
    SQL:12, // SQL
    WEB:13 // Web
  };

  var ProgramLanguage_desc = {
    '0':'Other',
    '1':'Java',
    '2':'C',
    '3':'C++',
    '4':'ObjectiveC',
    '5':'Python',
    '6':'Shell',
    '7':'JavaScript',
    '8':'PHP',
    '9':'Perl',
    '10':'Ruby',
    '11':'C#',
    '12':'SQL',
    '13':'Web'
  };

  var PublishState = {
    PENDING:1, // 待审核
    PUBLISHED:2, // 已发布
    REJECTED:3, // 已拒绝
    CANCELLED:4 // 已下架
  };

  var PublishState_desc = {
    '1':'待审核',
    '2':'已发布',
    '3':'已拒绝',
    '4':'已下架'
  };

  var PurchaseType = {
    PAPER:1, // 买试卷
    TEST:2, // 买测试
    BANK:3 // 买题库
  };

  var PurchaseType_desc = {
    '1':'买试卷',
    '2':'买测试',
    '3':'买题库'
  };

  var QuestionInfoFlags = {
    DETAIL:1, // 题目详情
    SUBS:2, // 包含子题目
    ANSWER:4, // 答案
    STAT:8, // 统计信息
    QB_BASE:16 // 题库信息
  };

  var QuestionSearchType = {
    BY_QBID:0, // 按题库
    BY_SKILL:1 // 按技能
  };

  var QuestionSearchType_desc = {
    '0':'按题库',
    '1':'按技能'
  };

  var QuestionType = {
    SCQ:1, // 单选题
    MCQS:2, // 多选题
    MCQ:3, // 不定项
    PROGRAM:4, // 编程题
    TEXT:5, // 问答题
    BCQ:6, // 判断题
    BLANK:9, // 填空题
    AUDIO:7, // 音频题
    VIDEO:8, // 视频题
    SCQ_TEXT:101, // 单选问答题
    MCQS_TEXT:102, // 多选问答题
    MCQ_TEXT:103, // 不定项问答
    SCQ_U:104, // 非确定单选
    COMBINATION:201 // 组合题
  };

  var QuestionType_desc = {
    '1':'单选题',
    '2':'多选题',
    '3':'不定项',
    '4':'编程题',
    '5':'问答题',
    '6':'判断题',
    '9':'填空题',
    '7':'音频题',
    '8':'视频题',
    '101':'单选问答题',
    '102':'多选问答题',
    '103':'不定项问答',
    '104':'非确定单选',
    '201':'组合题'
  };

  var RegionLevel = {
    COUNTRY:0, // 国家
    PROVINCE:1, // 省
    CITY:2 // 城市
  };

  var RelationType = {
    AND:1, // 与
    OR:2 // 或
  };

  var ReportInfoFlags = {
    REPORT_ONLY:1 // 只获取报告
  };

  var ReportState = {
    PENDING:0, // 未出报告
    FINISH:1, // 已出报告
    EXCEPTION:-1, // 出报告异常
    ARCHIVED:2, // 归档
    FACEPP_PENDING:3, // 待人脸识别
    SKIP_GRADE:4 // 跳过判卷
  };

  var ReportThreshold = {
    FORBID_SCORE:0, // 不允许查成绩
    PERMIT_SCORE:2, // 允许查成绩
    PERMIT_RESULT:6, // 可查对错
    PERMIT_ANSWER:14 // 可查答案
  };

  var ReportThreshold_desc = {
    '0':'不允许查成绩',
    '2':'允许查成绩',
    '6':'可查对错',
    '14':'可查答案'
  };

  var ReportType = {
    MBTI:"MBTI" // MBTI
  };

  var ReportType_desc = {
    'MBTI':'MBTI'
  };

  var RequiredType = {
    MANDATORY:1, // 必填
    OPTIONAL:2, // 选填
    DISPLAY:3, // 回显
    VALIDATE:4 // 校验
  };

  var RequiredType_desc = {
    '1':'必填',
    '2':'选填',
    '3':'回显',
    '4':'校验'
  };

  var ResourceAliyunFlags = {
    NUMBER:1, // 获取数量
    VALID_LIST:2, // 有效列表
    INVALID_LIST:4 // 无效列表
  };

  var ResourceAliyunState = {
    APPLYING:1, // 申请中
    APPLIED:2, // 已申请
    SUCCESS:3, // 成功
    APPLY_FAIL:4, // 申请失败
    DELETING:5, // 释放中
    DELETED:6, // 已释放
    DELETE_FAIL:7, // 释放失败
    EXTENDING:8, // 扩展中
    EXTENDED:9, // 已扩展
    EXTEND_FAIL:10 // 扩展失败
  };

  var ResourceAliyunState_desc = {
    '1':'申请中',
    '2':'已申请',
    '3':'成功',
    '4':'申请失败',
    '5':'释放中',
    '6':'已释放',
    '7':'释放失败',
    '8':'扩展中',
    '9':'已扩展',
    '10':'扩展失败'
  };

  var ResourceCommentState = {
    VALID:0, // 有效
    INVALID:1 // 无效
  };

  var ResourceDeleteFlags = {
    ACCESS:1, // 接入层
    PROGRAM:2, // 编程层
    ALL:3 // 所有层
  };

  var ResourceDeleteFlags_desc = {
    '1':'接入层',
    '2':'编程层',
    '3':'所有层'
  };

  var ResourceDiskId = {
    DATA_DISK_ID:"d-25ml1bn4j", // 数据盘
    SYS_DISK_ID:"d-25774wttj" // 系统盘
  };

  var ResourceDiskId_desc = {
    'd-25ml1bn4j':'数据盘',
    'd-25774wttj':'系统盘'
  };

  var ResourceInstanceStatus = {
    STARTING:"Starting", // 正在启动
    RUNNING:"Running", // 运行中
    STOPPING:"Stopping", // 正在停止
    STOPPED:"Stopped", // 已停止
    DELETED:"Deleted" // 已删除
  };

  var ResourceInstanceStatus_desc = {
    'Starting':'正在启动',
    'Running':'运行中',
    'Stopping':'正在停止',
    'Stopped':'已停止',
    'Deleted':'已删除'
  };

  var ResourcePermitNum = {
    CLAZZ_MAX_NORMAL:5, // 普通群个数
    CLAZZ_MAX_VIP:8, // VIP群个数
    CLAZZ_MAX_COMPANY:50, // 企业群个数
    CLAZZ_USER_MAX_TEACHER:10, // 管理员最大数量
    ClAZZ_PAPER_MAX:100, // 群组作业最大数量
    CLAZZ_USER_MAX_NORMAL:100, // 普通群成员个数
    CLAZZ_USER_MAX_VIP:100, // VIP群成员个数
    CLAZZ_USER_MAX_COMPANY:2000 // 企业群成员个数
  };

  var ResourceState = {
    NORMAL:0, // 正常
    ARCHIVED:1, // 已归档
    DELETED:2 // 已删除
  };

  var ResType = {
    PAPER:0, // 试卷
    QUESTION_BANK:1, // 题库
    ACTIVITY:2, // 活动
    REPORT:3, // 报告
    CLASS:4, // 班级
    INVITATION:5, // 邀请
    TEST:6, // 测试
    QUESTION:7, // 题目
    COURSE:8, // 课程
    EXAM_TEST:11, // 考试次数
    SMS:12, // 短信
    PDF:13, // PDF
    CLAZZ_VIP:20, // 群组升级
    CLAZZ_NEW:30, // 群组购买新建
    EMPLOYER_VIP:40 // VIP考试时间
  };

  var RetestInterval = {
    ONE_DAY:1, // 一天
    THREE_DAY:2, // 三天
    WEEKDAY:3, // 一周
    MONTH:4 // 一个月
  };

  var RetestInterval_desc = {
    '1':'一天',
    '2':'三天',
    '3':'一周',
    '4':'一个月'
  };

  var RootType = {
    WORK:1, // 工作目录
    ARCHIVE:2, // 归档
    TRASH:3 // 回收站
  };

  var RunnableLanguage = {
    JAVA:1, // Java
    C:2, // C
    CPP:3, // C++
    OBJECTIVE_C:4, // ObjectiveC
    PYTHON:5, // Python
    JAVASCRIPT:7, // JavaScript
    PHP:8 // PHP
  };

  var RunnableLanguage_desc = {
    '1':'Java',
    '2':'C',
    '3':'C++',
    '4':'ObjectiveC',
    '5':'Python',
    '7':'JavaScript',
    '8':'PHP'
  };

  var SentType = {
    EMAIL:1, // 邮件
    MESSAGE:4, // 短信
    NOTICE:8 // 站内信
  };

  var SetsConst = {
    BUCKET_PRIVATE:"101test-private", // 私有bucket
    BUCKET_PUBLIC:"101test-public", // 公有bucket
    OSS_PRIVATE:"http://101test-private.oss-cn-beijing.aliyuncs.com", // 私有地址
    OSS_PUBLIC:"http://101test-public.oss-cn-beijing.aliyuncs.com", // 公有地址
    PART_SEQ_PRACTICE:-1, // 试答partSeq
    NAME_REGEX:"^[^@]{2,}$", // NAME_REGEX
    EMAIL_REGEX:"^[^@\\s]+@[^@\\.\\s]+(\\.[^@\\.\\s]+)+$", // EMAIL_REGEX
    MAX_SUB_QUESTIONS:20, // 最大子题目数
    PRACTICE_BEFORE_TIME:"3600000", // 提前试答时间，单位毫秒
    MAX_UPLOAD_BYTES:52428800, // 上传文件限制
    MAX_PORTRAIT_BYTES:1048576, // 上传肖像限制
    LABEL_EMAIL:"邮箱", // 邮箱
    LABEL_PHONE:"手机号码", // 手机号码
    ACCOUNT_TYPE_EMAIL:0, // 邮箱登录账户
    ACCOUNT_TYPE_PHONE:1, // 手机登录账户
    CODE_MAX_VALID_MINUTE:15, // 验证码最长失效实现,单位分钟
    CODE_MAIL_MAX_VALID_HOUR:24, // 邮箱验证码最长失效实现,单位小时
    STORE_PAGE_ROWS:15, // 商店页面每页默认记录数
    MAX_PAPER_QUESTIONS:300, // 试卷中最大题目数
    MAX_TESTS_CONCURRENCY:100, // 普通用户默认最大并发测试数
    MAX_QB_IDS:30, // 最大题库数量
    DEFAULT_TAG_ID:0, // 未分组标签id
    DEFAULT_COMPANY_TAG_ID:1, // 企业未分组标签id
    DEFAULT_GROUP_PORTRAIT:"http://101test-public.oss-cn-beijing.aliyuncs.com/common/default-group-portrait.png", // 班级默认图像
    DEFAULT_EXAM_FOOTER:"答题中遇到问题请拨打客服电话010-8216(6778|6791|6796|6784|6631)或发邮件到service@exam.101test.com" // 默认答题页脚
  };

  var SetsConst_desc = {
    '101test-private':'私有bucket',
    '101test-public':'公有bucket',
    'http://101test-private.oss-cn-beijing.aliyuncs.com':'私有地址',
    'http://101test-public.oss-cn-beijing.aliyuncs.com':'公有地址',
    '-1':'试答partSeq',
    '^[^@]{2,}$':'NAME_REGEX',
    '^[^@\\s]+@[^@\\.\\s]+(\\.[^@\\.\\s]+)+$':'EMAIL_REGEX',
    '20':'最大子题目数',
    '3600000':'提前试答时间，单位毫秒',
    '52428800':'上传文件限制',
    '1048576':'上传肖像限制',
    '邮箱':'邮箱',
    '手机号码':'手机号码',
    '0':'邮箱登录账户',
    '1':'手机登录账户',
    '15':'验证码最长失效实现,单位分钟',
    '24':'邮箱验证码最长失效实现,单位小时',
    '15':'商店页面每页默认记录数',
    '300':'试卷中最大题目数',
    '100':'普通用户默认最大并发测试数',
    '30':'最大题库数量',
    '0':'未分组标签id',
    '1':'企业未分组标签id',
    'http://101test-public.oss-cn-beijing.aliyuncs.com/common/default-group-portrait.png':'班级默认图像',
    '答题中遇到问题请拨打客服电话010-8216(6778|6791|6796|6784|6631)或发邮件到service@exam.101test.com':'默认答题页脚'
  };

  var SharePermission = {
    SELECT:1, // 查看
    INSERT:2, // 增加
    UPDATE:4, // 修改
    DELETE:8, // 删除
    CHANGE:16, // 换题
    CREATE:32, // 创建
    GRANT_LINK:64, // 链接分享
    INVITE:128, // 录入
    GRANT_COPY:256, // 复制分享
    UPDATE_REPORT:512, // 修改报告
    PUBLISH:1024, // 允许发布
    MASK_GRANT:320, // 分享
    MASK_PAPER:2045, // 所有试卷权限
    MASK_QUESTION_BANK:1359, // 所有题库权限
    MASK_ACTIVITY:461, // 所有活动权限
    MASK_COURSE:1359, // 所有课件权限
    MASK_ALL:2047 // 所有权限
  };

  var ShareType = {
    SELL_PAPER:1, // 卖试卷
    SELL_TEST:2, // 卖测试
    SELL_BANK:3, // 卖题库
    PAPER:4, // 测试卷
    TEST:5, // 测试
    WANT:6, // 求购
    SHARE_PAPER:8, // 分享试卷
    PROMOTION:21 // 推广活动
  };

  var SmsState_desc = {
    '0':'待发送',
    '1':'发送成功',
    '2':'发送失败',
    '3':'不发送',
    '4':'等待中'
  };

  var SortType = {
    MONEY:0, // 金额
    RELATION:1, // 相关度
    LAST_UPDATE:2, // 更新时间
    SCORE:3, // 评价
    PURCHASES:4, // 购买量
    GRADE:5, // 得分
    RELATION_ID:6, // 题目id
    BEGIN_DATE:7, // 开始时间
    END_DATE:8, // 结束时间
    COMPANY_MONEY:9, // 企业金额
    PRAISE_NUM:10 // 点赞数
  };

  var SortType_desc = {
    '0':'金额',
    '1':'相关度',
    '2':'更新时间',
    '3':'评价',
    '4':'购买量',
    '5':'得分',
    '6':'题目id',
    '7':'开始时间',
    '8':'结束时间',
    '9':'企业金额',
    '10':'点赞数'
  };

  var StashType = {
    PAPER:1, // 试卷
    ACTIVITY:2 // 考场
  };

  var StatSetsType = {
    PAPER:0, // 试卷
    QUESTION_BANK:1, // 题库
    REPORT:2, // 报告
    CLAZZ:3, // 群组
    INVITATION:4, // 邀请
    QUESTION:5, // 题目
    TEST:6, // 测试
    EMPLOYER_REGISTER:7, // 注册
    QB_RELATION:8 // 题库题目
  };

  var StatTestInfoSortRule = {
    SORTYPE_DATEMONTH:"DATEMONTH", // 排序类型--->时间
    SORTYPE_TESTNUMBER:"TESTNUMBER", // 排序类型---->数目
    SORTRULE_DESC:-1, // 排序方式：-1降序
    SORTRULE_ASC:1 // 排序方式：1升序
  };

  var TaskState = {
    SUCCESS:0, // 成功
    PROGRESSING:1, // 处理中
    CANCELLED:2, // 已取消
    INTERRUPTED:3, // 被中断
    EXCEPTION:4 // 异常
  };

  var TaskType = {
    EXPORT_PDF_REPORTS:1, // 导出报告列表
    EXPORT_EXCEL_REPORTS:2, // 导出报告汇总
    RESOURCE_APPLY:3, // 资源申请
    EXPORT_EXCEL_STAT_TEST:4 // 导出考试统计信息
  };

  var TestAlreadyTime = {
    HOUR_HALF:"30", // 离开半小时
    HOUR_ONE:"60", // 离开一小时
    HOUR_TWO:"120", // 离开两小时
    HOUR_FIVE:"300" // 离开五小时
  };

  var TestAlreadyTime_desc = {
    '30':'离开半小时',
    '60':'离开一小时',
    '120':'离开两小时',
    '300':'离开五小时'
  };

  var TestLogType = {
    TEST:1, // 测试日志
    PART:2, // 部分日志
    SWITCH:3, // 切换日志
    RE_ENTER:4 // 考试后重新进入
  };

  var TestMethod = {
    PC:1, // 电脑端
    MOBILE:2, // 移动端
    ALL:3 // 电脑端和移动端
  };

  var TestMethod_desc = {
    '1':'电脑端',
    '2':'移动端',
    '3':'电脑端和移动端'
  };

  var TestPaperState = {
    PENDING:0, // 未生成
    FINISH:1, // 已生成
    FAILURE:-1 // 生成失败
  };

  var TestReportState = {
    NOT_STARTED:0, // 未答题
    ALREADY_ANSWERED:1 // 已答题
  };

  var TestState = {
    NOT_STARTED:0, // 未答题
    PROGRESSING:1, // 正在答题
    SUBMITTED:2, // 正常交卷
    SUBMITTED_AUTO:3, // 后台自动交卷
    SUBMITTED_AUTO_FRONT:4 // 前台自动交卷
  };

  var TestState_desc = {
    '0':'未答题',
    '1':'正在答题',
    '2':'正常交卷',
    '3':'后台自动交卷',
    '4':'前台自动交卷'
  };

  var UserInvitationType = {
    ALL_USERS:1, // 都通知
    LIST_USERS:2, // 指定用户通知
    EXCLUDE_USER:4 // 排除指定用户
  };

  var ValidationType = {
    MATCH_EXACTLY:0, // 完全匹配
    DOCUMENT:1 // 基于XML
  };

  var ValidationType_desc = {
    '0':'完全匹配',
    '1':'基于XML'
  };

  var ValueType = {
    LABEL:1, // 标签
    INPUT:2, // 输入框
    DROPBOX:3, // 下拉框
    CHECKBOX:4, // 复选框
    RADIOBOX:5, // 单选框
    SEARCH_DROPBOX:6, // 搜索下拉框
    MULTI_DROPBOX:7, // 多级下拉框
    PHOTO:8 // 拍照
  };

  var constant = {
    ActivityPropState : ActivityPropState,
    ActivityState : ActivityState,
    ActivityState_desc : ActivityState_desc,
    AliyunPath : AliyunPath,
    AnswerCommitType : AnswerCommitType,
    AnswerCommitType_desc : AnswerCommitType_desc,
    AnswerStyle : AnswerStyle,
    AnswerStyle_desc : AnswerStyle_desc,
    AttachmentType : AttachmentType,
    AttachmentType_desc : AttachmentType_desc,
    AuditState : AuditState,
    Authority : Authority,
    Authority_desc : Authority_desc,
    AuthorizedType : AuthorizedType,
    BankInfoFlags : BankInfoFlags,
    BasicType : BasicType,
    BasicType_desc : BasicType_desc,
    BindType : BindType,
    CatalogOrder : CatalogOrder,
    CatalogOrder_desc : CatalogOrder_desc,
    ChargeType : ChargeType,
    ClazzFeatures : ClazzFeatures,
    ClazzInfoFlags : ClazzInfoFlags,
    ClazzInfoFlags_desc : ClazzInfoFlags_desc,
    ClazzMemberType : ClazzMemberType,
    ClazzMemberType_desc : ClazzMemberType_desc,
    ClazzPerm : ClazzPerm,
    ClazzPerm_desc : ClazzPerm_desc,
    ClazzUserPerm : ClazzUserPerm,
    ClazzUserState : ClazzUserState,
    ClazzUserState_desc : ClazzUserState_desc,
    ClazzUserType : ClazzUserType,
    ClazzUserType_desc : ClazzUserType_desc,
    CodeType : CodeType,
    CombinationType : CombinationType,
    CompanyEmployerState : CompanyEmployerState,
    CompanyEmployerState_desc : CompanyEmployerState_desc,
    CompanyPerm : CompanyPerm,
    CompanyState : CompanyState,
    CompanyTemplateId : CompanyTemplateId,
    ConfigInfoFlags : ConfigInfoFlags,
    ConfigSaleState : ConfigSaleState,
    ConfigSaleState_desc : ConfigSaleState_desc,
    CourseInfoFlags : CourseInfoFlags,
    CourseType : CourseType,
    CourseType_desc : CourseType_desc,
    DataType : DataType,
    DemoPaperDevice : DemoPaperDevice,
    DemoPaperDevice_desc : DemoPaperDevice_desc,
    DeviceType : DeviceType,
    DevType : DevType,
    Difficulty : Difficulty,
    Difficulty_desc : Difficulty_desc,
    DocDescType : DocDescType,
    EmailErrorCode_desc : EmailErrorCode_desc,
    EmailState : EmailState,
    EmailType : EmailType,
    EmployerState : EmployerState,
    EmployerType : EmployerType,
    EmployerType_desc : EmployerType_desc,
    ErrorCode : ErrorCode,
    ErrorType : ErrorType,
    ExamingThreshold : ExamingThreshold,
    ExamingThreshold_desc : ExamingThreshold_desc,
    ExamState : ExamState,
    ExamState_desc : ExamState_desc,
    Features : Features,
    FileType : FileType,
    GiftState : GiftState,
    GiftState_desc : GiftState_desc,
    InfoId : InfoId,
    InfoId_desc : InfoId_desc,
    InfoSearchType : InfoSearchType,
    InstanceChargeType : InstanceChargeType,
    InstanceChargeType_desc : InstanceChargeType_desc,
    InterviewNotifyType : InterviewNotifyType,
    InterviewNotifyType_desc : InterviewNotifyType_desc,
    InterviewState : InterviewState,
    InterviewState_desc : InterviewState_desc,
    InvitationKey : InvitationKey,
    InvitationKey_desc : InvitationKey_desc,
    InvitationState : InvitationState,
    InvitationState_desc : InvitationState_desc,
    LoginType : LoginType,
    LogType : LogType,
    MBTISkill : MBTISkill,
    MBTISkill_desc : MBTISkill_desc,
    NotificationType : NotificationType,
    NotifyType : NotifyType,
    PageType : PageType,
    PaperInfoFlags : PaperInfoFlags,
    ParamType : ParamType,
    PartFlag : PartFlag,
    PayState : PayState,
    PayState_desc : PayState_desc,
    PayType : PayType,
    PayType_desc : PayType_desc,
    ProgramLanguage : ProgramLanguage,
    ProgramLanguage_desc : ProgramLanguage_desc,
    PublishState : PublishState,
    PublishState_desc : PublishState_desc,
    PurchaseType : PurchaseType,
    PurchaseType_desc : PurchaseType_desc,
    QuestionInfoFlags : QuestionInfoFlags,
    QuestionSearchType : QuestionSearchType,
    QuestionSearchType_desc : QuestionSearchType_desc,
    QuestionType : QuestionType,
    QuestionType_desc : QuestionType_desc,
    RegionLevel : RegionLevel,
    RelationType : RelationType,
    ReportInfoFlags : ReportInfoFlags,
    ReportState : ReportState,
    ReportThreshold : ReportThreshold,
    ReportThreshold_desc : ReportThreshold_desc,
    ReportType : ReportType,
    ReportType_desc : ReportType_desc,
    RequiredType : RequiredType,
    RequiredType_desc : RequiredType_desc,
    ResourceAliyunFlags : ResourceAliyunFlags,
    ResourceAliyunState : ResourceAliyunState,
    ResourceAliyunState_desc : ResourceAliyunState_desc,
    ResourceCommentState : ResourceCommentState,
    ResourceDeleteFlags : ResourceDeleteFlags,
    ResourceDeleteFlags_desc : ResourceDeleteFlags_desc,
    ResourceDiskId : ResourceDiskId,
    ResourceDiskId_desc : ResourceDiskId_desc,
    ResourceInstanceStatus : ResourceInstanceStatus,
    ResourceInstanceStatus_desc : ResourceInstanceStatus_desc,
    ResourcePermitNum : ResourcePermitNum,
    ResourceState : ResourceState,
    ResType : ResType,
    RetestInterval : RetestInterval,
    RetestInterval_desc : RetestInterval_desc,
    RootType : RootType,
    RunnableLanguage : RunnableLanguage,
    RunnableLanguage_desc : RunnableLanguage_desc,
    SentType : SentType,
    SetsConst : SetsConst,
    SetsConst_desc : SetsConst_desc,
    SharePermission : SharePermission,
    ShareType : ShareType,
    SmsState_desc : SmsState_desc,
    SortType : SortType,
    SortType_desc : SortType_desc,
    StashType : StashType,
    StatSetsType : StatSetsType,
    StatTestInfoSortRule : StatTestInfoSortRule,
    TaskState : TaskState,
    TaskType : TaskType,
    TestAlreadyTime : TestAlreadyTime,
    TestAlreadyTime_desc : TestAlreadyTime_desc,
    TestLogType : TestLogType,
    TestMethod : TestMethod,
    TestMethod_desc : TestMethod_desc,
    TestPaperState : TestPaperState,
    TestReportState : TestReportState,
    TestState : TestState,
    TestState_desc : TestState_desc,
    UserInvitationType : UserInvitationType,
    ValidationType : ValidationType,
    ValidationType_desc : ValidationType_desc,
    ValueType : ValueType
  };

  return {
    constant : constant
  };

})();