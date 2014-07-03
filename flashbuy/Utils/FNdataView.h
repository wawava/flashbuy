//
//  OTSDataView.h
//  OneStore
//
//  Created by huang jiming on 13-2-21.
//  Copyright (c) 2013年 OneStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FNdataView : UIView

@property (strong) id data;
@property (assign) long long idTag;

@end


@interface FNdataButton : UIButton

@property (strong) id data;
@property (assign) long long idTag;

@end

@interface FNdataImageView : UIImageView

@property (strong) id data;
@property (assign) long long idTag;

@end

@interface FNdataAlertView : UIAlertView

@property (strong) id data;
@property (assign) long long idTag;

@end
