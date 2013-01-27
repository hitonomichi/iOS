//
//  Sample_GData.m
//  SampleProject
//
//  Created by 高浜 一道 on 2013/01/27.
//  Copyright (c) 2013年 高浜 一道. All rights reserved.
//

#import "Sample_GData.h"

#import "GData.h"


@implementation Sample_GData
- (void) getGData
{
    // サービス初期化
    service = [[GDataServiceGoogleCalendar alloc] init];
    // アカウント設定
    [service setUserCredentialsWithUsername:@"hitonomichi88@gmail.com" password:@"fcdio888"];
    // 全てのカレンダーを取得するURL
    NSURL *feedURL = [NSURL URLWithString:kGDataGoogleCalendarDefaultAllCalendarsFeed];
    // サービスからフェッチする
    [service fetchFeedWithURL:feedURL delegate:self didFinishSelector:@selector(ticket:finishedWithFeed:error:)];


}
- (void)ticket:(GDataServiceTicket *)ticket finishedWithFeed:(GDataFeedCalendar *)feed error:(NSError *)error {

    if (error == nil) {
        NSArray *entries = [feed entries];
        if ([entries count] > 0) {
            // 最初のカレンダー
            GDataEntryCalendar *firstCalendar = [entries objectAtIndex:0];
            // カレンダーの名前
            GDataTextConstruct *titleTextConstruct = [firstCalendar title];
            NSString *title = [titleTextConstruct stringValue];
            // カレンダーの色
            NSString *color = [[firstCalendar color] stringValue];
            // カレンダーのURL
            NSURL *url = [[firstCalendar alternateLink] URL];
            NSLog(@"first calendar's title: %@", title);
            NSLog(@"first calendar's color: %@", color);
            NSLog(@"first calendar's url: %@", url);

            // 取得するイベントの最大日時
            NSCalendar *nsCalendar = [NSCalendar currentCalendar];
            NSDateComponents *comps_min = [[NSDateComponents alloc] init];
            [comps_min setDay:-30]; // 365日後
            NSDate *minDate = [nsCalendar dateByAddingComponents:comps_min toDate:[NSDate date] options:0];
            NSDateComponents *comps_max = [[NSDateComponents alloc] init];
            [comps_max setDay:365]; // 365日後
            NSDate *maxDate = [nsCalendar dateByAddingComponents:comps_max toDate:[NSDate date] options:0];
            // タイムゾーン
            NSTimeZone *tz = [NSTimeZone localTimeZone];

            NSURL *calendarURL = url; // カレンダーから取得したalternateLink

            // 検索クエリ
            GDataQueryCalendar *query = [GDataQueryCalendar calendarQueryWithFeedURL:calendarURL];
            NSDictionary *dict = [NSDictionary dictionaryWithObject:@"a" forKey:@"sortorder"];
            [query setCustomParameters:dict];
            // 開始日は-30日〜365日後までの範囲
            [query setMinimumStartTime:[GDataDateTime dateTimeWithDate:minDate timeZone:tz]];
            [query setMaximumStartTime:[GDataDateTime dateTimeWithDate:maxDate timeZone:tz]];
            // 8件取得
            [query setMaxResults:8];
            // 開始日でソート
            [query setOrderBy:@"starttime"];
            // 繰り返し予定をひとつのイベントとして扱う
            [query setShouldExpandRecurrentEvents:YES];

            [service fetchFeedWithQuery:query delegate:self didFinishSelector:@selector(eventListTicket:finishedWithFeed:error:)];

        } else {
            NSLog(@"the user has no calendars");
        }
    } else {
        NSLog(@"fetch error: %@", error);
    }
}

- (void)eventListTicket:(GDataServiceTicket *)ticket finishedWithFeed:(GDataFeedCalendarEvent *)feed error:(NSError *)error
{

    if (error == nil) {
        for ( GDataEntryCalendarEvent *event in [feed entries]) {
            // イベント名
            NSString *eventTitle = [[event title] stringValue];
            // イベント日時
            NSArray *eventTimes = [event times];
            GDataWhen *when = [eventTimes objectAtIndex:0];
            NSDate *startDateTime = [[when startTime] date];
            NSDate *endDateTime   = [[when endTime] date];
            BOOL *hasTime = [[when startTime] hasTime];
            NSString *val = [when value];

            NSLog(@"eventTitle: %@", eventTitle);
            NSLog(@"startDateTime: %@", startDateTime);
            NSLog(@"endDateTime: %@", endDateTime);
            NSLog(@"終日？: %d", hasTime);
            NSLog(@"val: %@", val);
        }
    }
}

@end
