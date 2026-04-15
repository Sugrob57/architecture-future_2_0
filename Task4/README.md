# Задание 4. Моделирование домена и интеграций

# Решение

## Bounded contexts

![BoundedContexts](/Task4/BoundedContexts.png)

## Event Storming (событийная модель)

![EventStorming](/Task4/EventStorming.png)

## Aggregates (ключевые)

1. Patient Aggregate
    Граница: пациент
    Ключ: patientId
    Инварианты:
        - пациент должен быть уникален
        - нельзя удалить при наличии лечения
2. Medical Case (Clinical)
    Ключ: caseId
    Инварианты:
        - кейс привязан к пациенту
        - статус: created → diagnosed → treated
3. Invoice Aggregate
    Ключ: invoiceId
    Инварианты:
        - сумма фиксирована после создания
        - нельзя оплатить дважды
4. Payment Aggregate
    Ключ: paymentId
    Инварианты:
        - сумма = invoice
        - идемпотентность
5. Loan Aggregate
    Ключ: loanId
    Инварианты:
        - либо approved, либо rejected
        - кредитный лимит
6. AI Request Aggregate
    Ключ: requestId
    Инварианты:
        - один результат на запрос
        - статус: pending → completed

## Каталог событий

Формат события (минимальный контракт)
```json
{
  "eventId": "uuid",
  "eventType": "PaymentCompleted",
  "timestamp": "ISO8601",
  "producer": "accounts",
  "payload": { }
}
```

### Основные события
|Событие |Контекст  |Семантика  |    Подписчики|
|--------|----------|-----------|--------------|
|PatientRegistered     |Patient   |Создан пациент      |Clinical, Billing|
|AppointmentScheduled  |Clinical  |Назначен визит      |AI|
|DiagnosisCreated      |Clinical  |Диагноз поставлен   |AI|
|AIDiagnosisCompleted  |AI        |Результат ИИ        |Clinical|
|TreatmentStarted      |Clinical  |Начато лечение      |Billing|
|InvoiceCreated        |Billing  |Создан счёт          |Payments|
|PaymentCompleted      |Accounts  |Оплата завершена    |Billing, Lending|
|LoanApproved          |Lending   |Кредит одобрен      |Accounts|
|InvoicePaid           |Billing  |Счёт закрыт          |Analytics|

## Обоснование Event-Driven подхода

### Проблемы текущей архитектуры (Camel + DWH)

- сервисы связаны через ESB
- Batch processing (медленно)
- Центральный DWH (много зависимостей, узкое место)
- Сложные делать трансформации (нужно менять во всех связанных системах)
- Плохой time-to-market

### Преимущества Event-Driven Architecture

1. Слабая связанность
    - сервисы не знают друг о друге
    - только события
2. Масштабируемость
    - Kafka масштабируется горизонтально
    - домены масштабируются независимо
3. Real-time обработка
    - вместо batch => streaming
    - отчёты будут сразу, а не после обработки пакета (batch'а)
4. Расширяемость
    - Добавление нового домена:
        - просто подписка на события
        - без изменения существующих систем
5. Надёжность
    - replay событий
    - DLQ
    - устойчивость к сбоям
6. Data Mesh
    - домены владеют данными
    - исчезает узкое место - DWH

### Сравнение

| Критерий |Camel + DWH | Event-driven |
|----------|------------|--------------|
|Связанность |Высокая |Низкая|
|Скорость |Batch | real-time|
|Масштабирование |Ограничено |Горизонтальное |
|Изменяемость |Сложная |Простая|
|Надёжность |Средняя |Высокая|