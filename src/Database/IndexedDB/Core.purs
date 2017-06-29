module Database.IndexedDB.Core
  ( class FromString, parse
  , INDEXED_DB
  , CursorDirection(..)
  , CursorSource(..)
  , Database
  , Index
  , KeyCursor
  , KeyRange
  , ObjectStore
  , Transaction
  , TransactionMode(..)
  , ValueCursor
  , module Database.IndexedDB.IDBKey
  ) where

import Prelude                     (class Show)

import Control.Monad.Eff           (kind Effect)
import Data.Maybe                  (Maybe(..))

import Database.IndexedDB.IDBKey


class FromString a where
  parse :: String -> Maybe a


data CursorDirection = Next | NextUnique | Prev | PrevUnique


data CursorSource = ObjectStore ObjectStore | Index Index


data TransactionMode = ReadOnly | ReadWrite | VersionChange


foreign import data INDEXED_DB :: Effect


foreign import data Database :: Type


foreign import data Index :: Type


foreign import data KeyCursor :: Type


foreign import data KeyRange :: Type


foreign import data ObjectStore :: Type


foreign import data Transaction :: Type


foreign import data ValueCursor :: Type


foreign import _showCursor :: forall cursor. cursor -> String
instance showKeyCursor :: Show KeyCursor where
  show = _showCursor


instance showValueCursor :: Show ValueCursor where
  show = _showCursor


foreign import _showDatabase :: Database -> String
instance showDatabase :: Show Database where
  show = _showDatabase


foreign import _showIndex :: Index -> String
instance showIndex :: Show Index where
  show = _showIndex


foreign import _showKeyRange :: KeyRange -> String
instance showKeyRange :: Show KeyRange where
  show = _showKeyRange


foreign import _showObjectStore :: ObjectStore -> String
instance showObjectStore :: Show ObjectStore where
  show = _showObjectStore


foreign import _showTransaction :: Transaction -> String
instance showTransaction :: Show Transaction where
  show = _showTransaction


instance showCursorDirection :: Show CursorDirection where
  show x =
    case x of
      Next       -> "next"
      NextUnique -> "nextunique"
      Prev       -> "prev"
      PrevUnique -> "prevunique"


instance showTransactionMode :: Show TransactionMode where
  show x =
    case x of
      ReadOnly      -> "readonly"
      ReadWrite     -> "readwrite"
      VersionChange -> "versionchange"


instance fromStringCursorDirection :: FromString CursorDirection where
  parse s =
    case s of
      "next"       -> Just Next
      "nextunique" -> Just NextUnique
      "prev"       -> Just Prev
      "prevunique" -> Just PrevUnique
      _            -> Nothing


instance fromStringTransactionMode :: FromString TransactionMode where
  parse s =
    case s of
      "readonly"      -> Just ReadOnly
      "readwrite"     -> Just ReadWrite
      "versionchange" -> Just VersionChange
      _               -> Nothing
