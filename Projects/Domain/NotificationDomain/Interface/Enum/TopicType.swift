import Foundation

public enum TopicType: String, Codable {
    case notice = "NOTICE"
    case studyRoomTimeSlot = "STUDY_ROOM_TIME_SLOT"
    case studyRoomApply = "STUDY_ROOM_APPLY"
    case pointGrant = "POINT_GRANT"
    case remainApply = "REMAIN_APPLY"
    case outingBefore = "OUTING_BEFORE"
    case comeBack = "COMEBACK"
}
