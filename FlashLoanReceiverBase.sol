// SPDX-License-Identifier: agpl-3.0
pragma solidity 0.6.12;

import {SafeMath} from 'Libraries.sol';
import {IERC20} from 'Interfaces.sol';
import {SafeERC20} from 'Libraries.sol';
import {IFlashLoanReceiver} from 'IFlashLoanReceiver.sol';
import {ILendingPoolAddressesProvider} from 'Interfaces.sol';
import {ILendingPool} from 'Interfaces.sol';

abstract contract FlashLoanReceiverBase is IFlashLoanReceiver {
  using SafeERC20 for IERC20;
  using SafeMath for uint256;

  ILendingPoolAddressesProvider public immutable override ADDRESSES_PROVIDER;
  ILendingPool public immutable override LENDING_POOL;

  constructor(ILendingPoolAddressesProvider provider) public {
    ADDRESSES_PROVIDER = provider;
    LENDING_POOL = ILendingPool(provider.getLendingPool());
  }
}
