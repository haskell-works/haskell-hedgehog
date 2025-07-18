module Hedgehog.Internal.Check
  ( check3
  ) where

import           Control.Monad.IO.Class (MonadIO(..))
import           Hedgehog.Internal.Property
import           Hedgehog.Internal.Report
import           Hedgehog.Internal.Runner (checkReport)

import qualified Hedgehog.Internal.Seed as Seed

-- | Check a property.
--
check3 :: MonadIO m => Property -> m Bool
check3 prop = do
  (== OK) . reportStatus <$> liftIO (checkReport (propertyConfig prop) 0 (Seed.from 1) (propertyTest prop) $ const (pure ()))
