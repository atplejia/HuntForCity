
//
//  ChooseCityDelegate
//  HuntForCity
//
//  Created by 金亮齐 on 2016/10/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//


@class City;
@class ChooseCityController;

@protocol ChooseCityDelegate <NSObject>

- (void) cityPickerController:(ChooseCityController *)chooseCityController
                didSelectCity:(City *)city;

- (void) cityPickerControllerDidCancel:(ChooseCityController *)chooseCityController;

@end

@protocol CityGroupCellDelegate <NSObject>

- (void) cityGroupCellDidSelectCity:(City *)city;

@end
