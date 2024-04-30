//
//  CloudKitServer.swift
//  Timeen
//
//  Created by Leonardo on 13/02/24.
//

import Foundation
import CloudKit

struct CloudKitServer {
    /// Constant containing the public CloudKit database
    private let publicDB = CKContainer.default().publicCloudDatabase
    
    /// Saves a record in the public CloudKit database.
    ///
    /// Attempts to save the provided `CKRecord` to CloudKit. On success, returns the saved record;
    /// on failure, returns an error.
    ///
    /// - Parameter record: The `CKRecord` to be saved.
    /// - Returns: A `Result` containing the `CKRecord` on success or an `Error` on failure.
    func save(record: CKRecord) async -> Result<CKRecord, Error> {
        do {
            let record = try await publicDB.save(record)
            return .success(record)
        } catch {
            return .failure(error)
        }
    }
    
    /// Fetches the first 100 records of a specific type from the CloudKit database.
    ///  
    /// Performs a query to CloudKit using a specific record type and predicates.
    /// Returns an array of `CKRecord` if the query is successful, or an error if it fails.
    /// Useful for retrieving a specific set of records based on defined criteria.
    ///  
    /// - Parameters:
    ///   - recordType: The type of record (`String`) to search for in CloudKit.
    ///   - predicates: The `NSCompoundPredicate` specifying the conditions to filter the records.
    /// - Returns: A `Result` containing an array of `CKRecord` on success or an `Error` on failure.
    func fetch(recordType: String, predicates: NSCompoundPredicate) async -> Result<[CKRecord], Error> {
        let query = CKQuery(recordType: recordType, predicate: predicates)
        var records: [CKRecord]
        do {
            let returnedResult = try await publicDB.records(matching: query)
            let idsAndRecords = returnedResult.matchResults
            records = idsAndRecords.compactMap { _, result in
                switch result {
                    case .success(let record): return record
                    case .failure: return nil
                }
            }
            return .success(records)
        } catch {
            return .failure(error)
        }
    }
    
    /// Fetches all records of a specific type from the CloudKit database, conforming to given predicates.
    ///
    /// This function performs a query to CloudKit using a specific record type and predicates. It retrieves all matching records,
    /// handling pagination internally with cursors. The function continues fetching records until all matching records are retrieved
    /// or an error occurs. It's especially useful for large datasets where multiple requests are needed to fetch all data.
    ///
    /// - Parameters:
    ///   - recordType: The type of record (`String`) to be retrieved from CloudKit.
    ///   - predicates: The `NSCompoundPredicate` specifying the conditions to filter the records.
    /// - Returns: A `Result` containing an array of `CKRecord` on success, or an `Error` on failure.
    ///
    /// The function utilizes an internal helper function `fetchRecords` to handle the pagination and fetching logic. This approach
    /// abstracts the complexity of handling cursors and makes `fetchAll` more manageable and reusable.
    func fetchAll(recordType: String, predicates: NSCompoundPredicate) async -> Result<[CKRecord], Error> {
        let query = CKQuery(recordType: recordType, predicate: predicates)
        var allRecords: [CKRecord] = []
        var cursor: CKQueryOperation.Cursor? = nil
        
        do {
            repeat {
                let returnedResult = try await fetchRecords(query: query, cursor: cursor)
                allRecords.append(contentsOf: returnedResult.records)
                cursor = returnedResult.cursor
            } while cursor != nil

            return .success(allRecords)
        } catch {
            return .failure(error)
        }
        
        func fetchRecords(query: CKQuery, cursor: CKQueryOperation.Cursor?) async throws -> (records: [CKRecord], cursor: CKQueryOperation.Cursor?) {
            let returnedResult: (matchResults: [(CKRecord.ID, Result<CKRecord, Error>)], queryCursor: CKQueryOperation.Cursor?)
            
            if let cursor = cursor {
                returnedResult = try await publicDB.records(continuingMatchFrom: cursor)
            } else {
                returnedResult = try await publicDB.records(matching: query)
            }

            let idsAndRecords = returnedResult.matchResults
            let records = idsAndRecords.compactMap { _, result in
                switch result {
                    case .success(let record): return record
                    case .failure: return nil
                }
            }
            let nextCursor = returnedResult.queryCursor
            return (records, nextCursor)
        }
    }
    
    /// Deletes a specified record from the CloudKit database.
    /// 
    /// This function attempts to delete the provided `CKRecord` from CloudKit. If the deletion is successful,
    /// it returns the ID of the deleted record. If it fails, it returns an error. This function is useful for
    /// removing data that is no longer needed or should no longer be stored in CloudKit.
    /// 
    /// - Parameter record: The `CKRecord` that is to be deleted from the database.
    /// - Returns: A `Result` containing the `CKRecord.ID` of the deleted record on success, or an `Error` on failure.
    /// 
    /// Note: Be cautious with this function as it permanently removes the record from CloudKit. Ensure that the record
    /// being deleted is intended for removal and is backed up if necessary.
    func delete(record: CKRecord) async -> Result<CKRecord.ID, Error> {
        do {
            let recordId = try await publicDB.deleteRecord(withID: record.recordID)
            return .success(recordId)
        } catch {
            return .failure(error)
        }
    }
}
